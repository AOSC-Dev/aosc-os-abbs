#!/usr/bin/env python3

import argparse
import os
import pathlib

from typing import Self
from time import sleep


class TLPackageEntry:

	@classmethod
	def from_paragraph(cls, paragraph: str) -> Self:
		'''
		Parses one paragraph of the TeXLive Package Database File.
		Returns an instance of TLPackageEntry.
		'''
		it = iter(paragraph.splitlines())
		obj: TLPackageEntry = cls()
		cur_line: str | None = next(it, None)
		while cur_line != None:
			if len(cur_line.strip()) == 0:
				cur_line = next(it, None)
				continue
			if cur_line.startswith(' '):
				cur_line = next(it, None)
				continue
			k, v = cur_line.split(None, 1)
			p = obj.name
			match k:
				case 'docfiles':
					p = obj.docfiles
				case 'srcfiles':
					p = obj.srcfiles
				case 'runfiles':
					p = obj.runfiles
				case 'binfiles':
					p = obj.binfiles
				case _:
					pass
			match k:
				case 'name':
					obj.name = v
				case 'revision':
					obj.revision = v
				case 'category':
					obj.category = v
				case 'shortdesc':
					obj.shortdesc = v
				case 'longdesc':
					obj.longdesc = '\n'.join([obj.longdesc, v.strip()])
				case 'depend':
					obj.depends.append(v)
				case 'execute':
					obj.executes.append(v)
				case 'postaction':
					obj.postactions.append(v)
				case 'binfiles':
					l = []
					cur_line = next(it)
					if cur_line == None:
						raise Exception(f"Invalid paragraph at package {obj.name}")
					while cur_line != None and cur_line.startswith(' '):
						file = cur_line.strip()
						l.append(file)
						cur_line = next(it, None)
					obj.binfiles[v] = l
					# Note: Do not double advance here, or you will skip lines.
					continue
				case 'docfiles' | 'srcfiles' | 'runfiles':
					obj.filesizes[k] = v
					cur_line = next(it)
					if cur_line == None:
						raise Exception(f"Invalid paragraph at package {obj.name}")
					while cur_line != None and cur_line.startswith(' '):
						file = cur_line.strip()
						p.append(file)
						cur_line = next(it, None)
					# Do not double advance here.
					continue
				case _:
					obj.other_attrs[k] = v

			cur_line = next(it, None)
			continue
		obj.longdesc = obj.longdesc.lstrip('\n')
		return obj

	def __init__(self):
		self.name = ''
		self.shortdesc = ''
		self.longdesc = ''
		self.revision = ''
		self.filesizes = {}
		self.executes = []
		self.postactions = []
		self.binfiles = {}
		self.docfiles = []
		self.srcfiles = []
		self.runfiles = []
		self.depends = []
		self.category = []
		self.other_attrs = {}

	def __str__(self):
		s = []
		s.append(f"name {self.name}")
		s.append(f"category {self.category}")
		s.append(f"revision {self.revision}")
		if len(self.shortdesc) > 0:
			s.append(f"shortdesc {self.shortdesc}")
		for l in self.longdesc.splitlines():
			if len(l) == 0:
				continue
			s.append(f"longdesc {l}")

		for entry in self.depends:
			s.append(f"depend {entry}")

		for entry in self.executes:
			s.append(f"execute {entry}")

		for entry in self.postactions:
			s.append(f"postaction {entry}")

		for k in self.binfiles:
			s.append(f"binfiles {k}")
			for f in self.binfiles.get(k):
				s.append(f" {f}")

		if len(self.docfiles) > 0:
			s.append(f"docfiles {self.filesizes['docfiles']}")
			for f in self.docfiles:
				s.append(f" {f}")

		if len(self.srcfiles) > 0:
			s.append(f"srcfiles {self.filesizes['srcfiles']}")
			for f in self.srcfiles:
				s.append(f" {f}")

		if len(self.runfiles) > 0:
			s.append(f"runfiles {self.filesizes['runfiles']}")
			for f in self.runfiles:
				s.append(f" {f}")

		for k in self.other_attrs:
			s.append(f"{k} {self.other_attrs.get(k)}")

		s.append("")
		s.append("")
		return "\n".join(s)

def main():
	parser = argparse.ArgumentParser(description="Collect files from texlive.tlpdb")
	parser.add_argument('tlpdb')
	parser.add_argument('outdir')
	args = parser.parse_args()
	pkgs = {}
	i = 0
	with open(args.tlpdb, 'r') as f:
		it = iter(f.read().split('\n\n'))
		p = next(it, None)
		while p != None and len(p.strip('\n').strip()) != 0:
			try:
				obj = TLPackageEntry.from_paragraph(p.rstrip('\n'))
				i += 1
				print("\r\033[2K[{}] Got package {}".format(i, obj.name), end='')
				pkgs[obj.name] = obj
			except Exception as e:
				print("\nInvalid package: {}".format(e.with_traceback()))

			p = next(it, None)
	print()
	print("Collected {} packages.".format(len(pkgs)))

	collection = [
		"collection-basic",
		"collection-bibtexextra",
		"collection-binextra",
		"collection-context",
		"collection-fontsextra",
		"collection-fontsrecommended",
		"collection-fontutils",
		"collection-formatsextra",
		"collection-games",
		"collection-humanities",
		"collection-langarabic",
		"collection-langchinese",
		"collection-langcjk",
		"collection-langcyrillic",
		"collection-langczechslovak",
		"collection-langenglish",
		"collection-langeuropean",
		"collection-langfrench",
		"collection-langgerman",
		"collection-langgreek",
		"collection-langitalian",
		"collection-langjapanese",
		"collection-langkorean",
		"collection-langother",
		"collection-langpolish",
		"collection-langportuguese",
		"collection-langspanish",
		"collection-latex",
		"collection-latexextra",
		"collection-latexrecommended",
		"collection-luatex",
		"collection-mathscience",
		"collection-metapost",
		"collection-music",
		"collection-pictures",
		"collection-plaingeneric",
		"collection-pstricks",
		"collection-publishers",
		"collection-xetex",
	]

	binfiles = []
	docfiles = []
	srcfiles = []
	runfiles = []
	flattened_pkgs = set()

	print("Checking for collections ...")
	for o in collection:
		print(f"Checking for {o} ...")
		if o not in pkgs.keys():
			raise Exception(f"{o} does not exist.")
		flattened_pkgs.add(o)

	print("Resolving dependencies ...")
	round = 1
	lastlen = 0
	currentlen = len(flattened_pkgs)
	while currentlen > lastlen:
		print(f"Dependency resolving round {round}")
		for o in list(flattened_pkgs):
			if o not in pkgs.keys():
				raise Exception(f"{o} does not exist.")
			for dep in pkgs.get(o).depends:
				name = dep.split().pop(0)
				if not name.endswith('.ARCH'):
					flattened_pkgs.add(name)
		lastlen = currentlen
		currentlen = len(flattened_pkgs)
		round += 1

	print("Collecting files ...")
	for pkg in flattened_pkgs:
		o = pkgs[pkg]
		for f in o.binfiles:
			if f.startswith("texmf-dist/"):
				binfiles.append(f.split().pop(0) + '\n')
		for f in o.srcfiles:
			if f.startswith("texmf-dist/"):
				srcfiles.append(f.split().pop(0) + '\n')
		for f in o.runfiles:
			if f.startswith("texmf-dist/"):
				runfiles.append(f.split().pop(0) + '\n')
		for f in o.docfiles:
			if f.startswith("texmf-dist/"):
				docfiles.append(f.split().pop(0) + '\n')

	binfiles.sort()
	srcfiles.sort()
	docfiles.sort()
	runfiles.sort()

	print(f"Collected {len(binfiles)} binfiles.")
	print(f"Collected {len(srcfiles)} srcfiles.")
	print(f"Collected {len(docfiles)} docfiles.")
	print(f"Collected {len(runfiles)} runfiles.")

	print("Exporting lists ...")
	os.makedirs(pathlib.Path(args.outdir), exist_ok=True)
	with open(pathlib.Path(args.outdir).joinpath('binfiles.txt'), 'w') as f:
		f.writelines(binfiles)

	with open(pathlib.Path(args.outdir).joinpath("srcfiles.txt"), 'w') as f:
		f.writelines(srcfiles)

	with open(pathlib.Path(args.outdir).joinpath("docfiles.txt"), 'w') as f:
		f.writelines(docfiles)

	with open(pathlib.Path(args.outdir).joinpath("runfiles.txt"), 'w') as f:
		f.writelines(runfiles)

if __name__ == '__main__':
	main()
