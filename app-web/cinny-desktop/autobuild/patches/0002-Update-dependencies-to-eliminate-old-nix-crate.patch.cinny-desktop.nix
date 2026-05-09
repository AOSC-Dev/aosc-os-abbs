From 5efc56e6f6d3ba50f4aa15d4337c3a434b54e4ff Mon Sep 17 00:00:00 2001
From: Kaiyang Wu <origincode@aosc.io>
Date: Thu, 7 May 2026 20:46:46 +0800
Subject: [PATCH 2/2] Update dependencies to eliminate old nix crate

Signed-off-by: Kaiyang Wu <origincode@aosc.io>
---
 src-tauri/Cargo.lock | 4027 +++++++++++++++++++-----------------------
 1 file changed, 1844 insertions(+), 2183 deletions(-)

diff --git a/src-tauri/Cargo.lock b/src-tauri/Cargo.lock
index d01e7d7..95a51d8 100644
--- a/src-tauri/Cargo.lock
+++ b/src-tauri/Cargo.lock
@@ -3,16 +3,16 @@
 version = 3
 
 [[package]]
-name = "adler"
-version = "1.0.2"
+name = "adler2"
+version = "2.0.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "f26201604c87b1e01bd3d98f8d5d9a8fcbb815e8cedb41ffccbeb4bf593a35fe"
+checksum = "320119579fcad9c21884f5c4861d16174d0e06250625266f50fe6898340abefa"
 
 [[package]]
 name = "aho-corasick"
-version = "1.1.2"
+version = "1.1.4"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "b2969dcb958b36655471fc61f7e416fa76033bdd4bfed0678d8fee1e2d07a1f0"
+checksum = "ddd31a130427c27518df266943a5308ed92d4b226cc639f5a8f1002816174301"
 dependencies = [
  "memchr",
 ]
@@ -32,12 +32,6 @@ dependencies = [
  "alloc-no-stdlib",
 ]
 
-[[package]]
-name = "android-tzdata"
-version = "0.1.1"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "e999941b234f3131b00bc13c22d06e8c5ff726d1b6318ac7eb276997bbb4fef0"
-
 [[package]]
 name = "android_system_properties"
 version = "0.1.5"
@@ -49,28 +43,29 @@ dependencies = [
 
 [[package]]
 name = "anyhow"
-version = "1.0.66"
+version = "1.0.102"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "216261ddc8289130e551ddcd5ce8a064710c0d064a4d2895c67151c92b5443f6"
+checksum = "7f202df86484c868dbad7eaa557ef785d5c66295e41b460ef922eca0723b842c"
 
 [[package]]
 name = "arboard"
-version = "3.2.1"
+version = "3.6.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "ac57f2b058a76363e357c056e4f74f1945bf734d37b8b3ef49066c4787dde0fc"
+checksum = "0348a1c054491f4bfe6ab86a7b6ab1e44e45d899005de92f58b3df180b36ddaf"
 dependencies = [
  "clipboard-win",
- "core-graphics 0.22.3",
  "image",
  "log",
- "objc",
- "objc-foundation",
- "objc_id",
+ "objc2",
+ "objc2-app-kit",
+ "objc2-core-foundation",
+ "objc2-core-graphics",
+ "objc2-foundation",
  "parking_lot",
- "thiserror 1.0.50",
- "winapi",
+ "percent-encoding",
+ "windows-sys 0.60.2",
  "wl-clipboard-rs",
- "x11rb 0.10.1",
+ "x11rb",
 ]
 
 [[package]]
@@ -79,27 +74,6 @@ version = "1.1.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
 checksum = "d92bec98840b8f03a5ff5413de5293bfcd8bf96467cf5452609f939ec6f5de16"
 
-[[package]]
-name = "ashpd"
-version = "0.9.2"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "4d43c03d9e36dd40cab48435be0b09646da362c278223ca535493877b2c1dee9"
-dependencies = [
- "enumflags2",
- "futures-channel",
- "futures-util",
- "rand 0.8.5",
- "raw-window-handle",
- "serde",
- "serde_repr",
- "tokio",
- "url",
- "wayland-backend",
- "wayland-client 0.31.11",
- "wayland-protocols 0.32.9",
- "zbus",
-]
-
 [[package]]
 name = "async-broadcast"
 version = "0.7.2"
@@ -126,52 +100,41 @@ dependencies = [
 
 [[package]]
 name = "async-executor"
-version = "1.13.2"
+version = "1.14.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "bb812ffb58524bdd10860d7d974e2f01cc0950c2438a74ee5ec2e2280c6c4ffa"
+checksum = "c96bf972d85afc50bf5ab8fe2d54d1586b4e0b46c97c50a0c9e71e2f7bcd812a"
 dependencies = [
  "async-task",
  "concurrent-queue",
- "fastrand 2.3.0",
+ "fastrand",
  "futures-lite",
  "pin-project-lite",
  "slab",
 ]
 
-[[package]]
-name = "async-fs"
-version = "2.1.3"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "09f7e37c0ed80b2a977691c47dae8625cfb21e205827106c64f7c588766b2e50"
-dependencies = [
- "async-lock",
- "blocking",
- "futures-lite",
-]
-
 [[package]]
 name = "async-io"
-version = "2.5.0"
+version = "2.6.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "19634d6336019ef220f09fd31168ce5c184b295cbf80345437cc36094ef223ca"
+checksum = "456b8a8feb6f42d237746d4b3e9a178494627745c3c56c6ea55d92ba50d026fc"
 dependencies = [
- "async-lock",
+ "autocfg",
  "cfg-if",
  "concurrent-queue",
  "futures-io",
  "futures-lite",
  "parking",
  "polling",
- "rustix 1.0.8",
+ "rustix",
  "slab",
- "windows-sys 0.60.2",
+ "windows-sys 0.61.2",
 ]
 
 [[package]]
 name = "async-lock"
-version = "3.4.1"
+version = "3.4.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "5fd03604047cee9b6ce9de9f70c6cd540a0520c813cbd49bae61f33ab80ed1dc"
+checksum = "290f7f2596bd5b78a9fec8088ccd89180d7f9f55b94b0576823bbbdc72ee8311"
 dependencies = [
  "event-listener",
  "event-listener-strategy",
@@ -180,9 +143,9 @@ dependencies = [
 
 [[package]]
 name = "async-process"
-version = "2.4.0"
+version = "2.5.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "65daa13722ad51e6ab1a1b9c01299142bc75135b337923cfa10e79bbbd669f00"
+checksum = "fc50921ec0055cdd8a16de48773bfeec5c972598674347252c0399676be7da75"
 dependencies = [
  "async-channel",
  "async-io",
@@ -193,7 +156,7 @@ dependencies = [
  "cfg-if",
  "event-listener",
  "futures-lite",
- "rustix 1.0.8",
+ "rustix",
 ]
 
 [[package]]
@@ -204,14 +167,14 @@ checksum = "3b43422f69d8ff38f95f1b2bb76517c91589a924d1559a0e935d7c8ce0274c11"
 dependencies = [
  "proc-macro2",
  "quote",
- "syn 2.0.106",
+ "syn 2.0.117",
 ]
 
 [[package]]
 name = "async-signal"
-version = "0.2.12"
+version = "0.2.14"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "f567af260ef69e1d52c2b560ce0ea230763e6fbb9214a85d768760a920e3e3c1"
+checksum = "52b5aaafa020cf5053a01f2a60e8ff5dccf550f0f77ec54a4e47285ac2bab485"
 dependencies = [
  "async-io",
  "async-lock",
@@ -219,10 +182,10 @@ dependencies = [
  "cfg-if",
  "futures-core",
  "futures-io",
- "rustix 1.0.8",
+ "rustix",
  "signal-hook-registry",
  "slab",
- "windows-sys 0.60.2",
+ "windows-sys 0.61.2",
 ]
 
 [[package]]
@@ -239,7 +202,7 @@ checksum = "9035ad2d096bed7955a320ee7e2230574d28fd3c3a0f186cbea1ff3c7eed5dbb"
 dependencies = [
  "proc-macro2",
  "quote",
- "syn 2.0.106",
+ "syn 2.0.117",
 ]
 
 [[package]]
@@ -273,27 +236,36 @@ checksum = "1505bd5d3d116872e7271a6d4e16d81d0c8570876c8de68093a09ac269d8aac0"
 
 [[package]]
 name = "autocfg"
-version = "1.1.0"
+version = "1.5.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"
+checksum = "c08606f8c3cbf4ce6ec8e28fb0014a2c086708fe954eaa885384a6165172e7e8"
 
 [[package]]
 name = "base64"
-version = "0.13.1"
+version = "0.21.7"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "9e1b586273c5702936fe7b7d6896644d8be71e6314cfe09d3167c95f712589e8"
+checksum = "9d297deb1925b89f2ccc13d7635fa0714f12c87adce1c75356b39ca9b7178567"
 
 [[package]]
 name = "base64"
-version = "0.21.5"
+version = "0.22.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "35636a1494ede3b646cc98f74f8e62c773a38a659ebc777a2cf26b9b74171df9"
+checksum = "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6"
 
 [[package]]
-name = "base64"
-version = "0.22.1"
+name = "bit-set"
+version = "0.8.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6"
+checksum = "08807e080ed7f9d5433fa9b275196cfc35414f66a0c79d864dc51a0d825231a3"
+dependencies = [
+ "bit-vec",
+]
+
+[[package]]
+name = "bit-vec"
+version = "0.8.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "5e764a1d40d510daf35e07be9eb06e75770908c27d411ee6c92109c9840eaaf7"
 
 [[package]]
 name = "bitflags"
@@ -303,44 +275,29 @@ checksum = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
 
 [[package]]
 name = "bitflags"
-version = "2.8.0"
+version = "2.11.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "8f68f53c83ab957f72c32642f3868eec03eb974d1fb82e453128456482613d36"
+checksum = "c4512299f36f043ab09a583e57bceb5a5aab7a73db1805848e8fef3c9e8c78b3"
 dependencies = [
- "serde",
+ "serde_core",
 ]
 
-[[package]]
-name = "block"
-version = "0.1.6"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "0d8c1fef690941d3e7788d328517591fecc684c084084702d6ff1641e993699a"
-
 [[package]]
 name = "block-buffer"
-version = "0.10.3"
+version = "0.10.4"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "69cce20737498f97b993470a6e536b8523f0af7892a4f928cceb1ac5e52ebe7e"
+checksum = "3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71"
 dependencies = [
  "generic-array",
 ]
 
 [[package]]
 name = "block2"
-version = "0.5.1"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "2c132eebf10f5cad5289222520a4a058514204aed6d791f1cf4fe8088b82d15f"
-dependencies = [
- "objc2 0.5.2",
-]
-
-[[package]]
-name = "block2"
-version = "0.6.1"
+version = "0.6.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "340d2f0bdb2a43c1d3cd40513185b2bd7def0aa1052f956455114bc98f82dcf2"
+checksum = "cdeb9d870516001442e364c5220d3574d2da8dc765554b4a617230d33fa58ef5"
 dependencies = [
- "objc2 0.6.2",
+ "objc2",
 ]
 
 [[package]]
@@ -379,27 +336,33 @@ dependencies = [
 
 [[package]]
 name = "bumpalo"
-version = "3.11.1"
+version = "3.20.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "572f695136211188308f16ad2ca5c851a712c464060ae6974944458eb83880ba"
+checksum = "5d20789868f4b01b2f2caec9f5c4e0213b41e3e5702a50157d699ae31ced2fcb"
 
 [[package]]
 name = "bytemuck"
-version = "1.12.3"
+version = "1.25.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "aaa3a8d9a1ca92e282c96a32d6511b695d7d994d1d102ba85d279f9b2756947f"
+checksum = "c8efb64bd706a16a1bdde310ae86b351e4d21550d98d056f22f8a7f7a2183fec"
 
 [[package]]
 name = "byteorder"
-version = "1.4.3"
+version = "1.5.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "1fd0f2584146f6f2ef48085050886acf353beff7305ebd1ae69500e27c67f64b"
+
+[[package]]
+name = "byteorder-lite"
+version = "0.1.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "14c189c53d098945499cdfa7ecc63567cf3886b3332b312a5b4585d8d3a6a610"
+checksum = "8f1fe948ff07f4bd06c30984e69f5b4899c516a3ef74f34df92a2df2ab535495"
 
 [[package]]
 name = "bytes"
-version = "1.10.1"
+version = "1.11.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "d71b6127be86fdcfddb610f7182ac57211d4b18a3e9c82eb2d17662f2227ad6a"
+checksum = "1e748733b7cbc798e1434b6ac524f0c1ff2ab456fe201501e6497c8417a4fc33"
 dependencies = [
  "serde",
 ]
@@ -410,12 +373,12 @@ version = "0.18.5"
 source = "registry+https://github.com/rust-lang/crates.io-index"
 checksum = "8ca26ef0159422fb77631dc9d17b102f253b876fe1586b03b803e63a309b4ee2"
 dependencies = [
- "bitflags 2.8.0",
+ "bitflags 2.11.1",
  "cairo-sys-rs",
  "glib",
  "libc",
  "once_cell",
- "thiserror 1.0.50",
+ "thiserror 1.0.69",
 ]
 
 [[package]]
@@ -431,11 +394,11 @@ dependencies = [
 
 [[package]]
 name = "camino"
-version = "1.1.11"
+version = "1.2.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "5d07aa9a93b00c76f71bc35d598bed923f6d4f3a9ca5c24b7737ae1a292841c0"
+checksum = "e629a66d692cb9ff1a1c664e41771b3dcaf961985a9774c0eb0bd1b51cf60a48"
 dependencies = [
- "serde",
+ "serde_core",
 ]
 
 [[package]]
@@ -455,10 +418,10 @@ checksum = "dd5eb614ed4c27c5d706420e4320fbe3216ab31fa1c33cd8246ac36dae4479ba"
 dependencies = [
  "camino",
  "cargo-platform",
- "semver 1.0.14",
+ "semver",
  "serde",
  "serde_json",
- "thiserror 2.0.15",
+ "thiserror 2.0.18",
 ]
 
 [[package]]
@@ -468,15 +431,16 @@ source = "registry+https://github.com/rust-lang/crates.io-index"
 checksum = "374b7c592d9c00c1f4972ea58390ac6b18cbb6ab79011f3bdc90a0b82ca06b77"
 dependencies = [
  "serde",
- "toml 0.9.5",
+ "toml 0.9.12+spec-1.1.0",
 ]
 
 [[package]]
 name = "cc"
-version = "1.2.33"
+version = "1.2.62"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "3ee0f8803222ba5a7e2777dd72ca451868909b1ac410621b676adf07280e9b5f"
+checksum = "a1dce859f0832a7d088c4f1119888ab94ef4b5d6795d1ce05afb7fe159d79f98"
 dependencies = [
+ "find-msvc-tools",
  "shlex",
 ]
 
@@ -499,18 +463,19 @@ dependencies = [
 
 [[package]]
 name = "cfg-expr"
-version = "0.11.0"
+version = "0.15.8"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "b0357a6402b295ca3a86bc148e84df46c02e41f41fef186bda662557ef6328aa"
+checksum = "d067ad48b8650848b989a59a86c6c36a995d02d2bf778d45c3c5d57bc2718f02"
 dependencies = [
  "smallvec",
+ "target-lexicon",
 ]
 
 [[package]]
 name = "cfg-if"
-version = "1.0.0"
+version = "1.0.4"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
+checksum = "9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801"
 
 [[package]]
 name = "cfg_aliases"
@@ -520,15 +485,14 @@ checksum = "613afe47fcd5fac7ccf1db93babcb082c5994d996f20b8b159f2ad1658eb5724"
 
 [[package]]
 name = "chrono"
-version = "0.4.31"
+version = "0.4.44"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "7f2c685bad3eb3d45a01354cedb7d5faa66194d1d58ba6e267a8de788f79db38"
+checksum = "c673075a2e0e5f4a1dde27ce9dee1ea4558c7ffe648f576438a20ca1d2acc4b0"
 dependencies = [
- "android-tzdata",
  "iana-time-zone",
  "num-traits",
  "serde",
- "windows-targets 0.48.5",
+ "windows-link 0.2.1",
 ]
 
 [[package]]
@@ -560,26 +524,18 @@ dependencies = [
 
 [[package]]
 name = "clipboard-win"
-version = "4.5.0"
+version = "5.4.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "7191c27c2357d9b7ef96baac1773290d4ca63b24205b82a3fd8a0637afcf0362"
+checksum = "bde03770d3df201d4fb868f2c9c59e66a3e4e2bd06692a0fe701e7103c7e84d4"
 dependencies = [
  "error-code",
- "str-buf",
- "winapi",
 ]
 
-[[package]]
-name = "color_quant"
-version = "1.1.0"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "3d7b894f5411737b7867f4827955924d7c254fc9f4d91a6aad6b097804b1018b"
-
 [[package]]
 name = "combine"
-version = "4.6.6"
+version = "4.6.7"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "35ed6e9d84f0b51a7f52daf1c7d71dd136fd7a3f41a8462b8cdb8c78d920fad4"
+checksum = "ba5a308b75df32fe02788e748662718f03fde005016435c444eea572398219fd"
 dependencies = [
  "bytes",
  "memchr",
@@ -594,23 +550,6 @@ dependencies = [
  "crossbeam-utils",
 ]
 
-[[package]]
-name = "convert_case"
-version = "0.4.0"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "6245d59a3e82a7fc217c5828a6692dbc6dfb63a0c8c90495621f7b9d79704a0e"
-
-[[package]]
-name = "cookie"
-version = "0.17.0"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "7efb37c3e1ccb1ff97164ad95ac1606e8ccd35b3fa0a7d99a304c7f4a428cc24"
-dependencies = [
- "percent-encoding",
- "time",
- "version_check",
-]
-
 [[package]]
 name = "cookie"
 version = "0.18.1"
@@ -624,30 +563,13 @@ dependencies = [
 
 [[package]]
 name = "cookie_store"
-version = "0.20.0"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "387461abbc748185c3a6e1673d826918b450b87ff22639429c694619a83b6cf6"
-dependencies = [
- "cookie 0.17.0",
- "idna 0.3.0",
- "log",
- "publicsuffix",
- "serde",
- "serde_derive",
- "serde_json",
- "time",
- "url",
-]
-
-[[package]]
-name = "cookie_store"
-version = "0.21.1"
+version = "0.22.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "2eac901828f88a5241ee0600950ab981148a18f2f756900ffba1b125ca6a3ef9"
+checksum = "15b2c103cf610ec6cae3da84a766285b42fd16aad564758459e6ecf128c75206"
 dependencies = [
- "cookie 0.18.1",
+ "cookie",
  "document-features",
- "idna 1.0.3",
+ "idna",
  "log",
  "publicsuffix",
  "serde",
@@ -659,9 +581,9 @@ dependencies = [
 
 [[package]]
 name = "core-foundation"
-version = "0.9.3"
+version = "0.9.4"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "194a7a9e6de53fa55116934067c844d9d749312f75c6f6d0980e8c252f8c2146"
+checksum = "91e195e091a93c46f7102ec7818a2aa394e1e1771c3ab4825963fa03e45afb8f"
 dependencies = [
  "core-foundation-sys",
  "libc",
@@ -685,39 +607,14 @@ checksum = "773648b94d0e5d620f64f280777445740e61fe701025087ec8b57f45c791888b"
 
 [[package]]
 name = "core-graphics"
-version = "0.22.3"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "2581bbab3b8ffc6fcbd550bf46c355135d16e9ff2a6ea032ad6b9bf1d7efe4fb"
-dependencies = [
- "bitflags 1.3.2",
- "core-foundation 0.9.3",
- "core-graphics-types 0.1.1",
- "foreign-types 0.3.2",
- "libc",
-]
-
-[[package]]
-name = "core-graphics"
-version = "0.24.0"
+version = "0.25.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "fa95a34622365fa5bbf40b20b75dba8dfa8c94c734aea8ac9a5ca38af14316f1"
+checksum = "064badf302c3194842cf2c5d61f56cc88e54a759313879cdf03abdd27d0c3b97"
 dependencies = [
- "bitflags 2.8.0",
+ "bitflags 2.11.1",
  "core-foundation 0.10.1",
- "core-graphics-types 0.2.0",
- "foreign-types 0.5.0",
- "libc",
-]
-
-[[package]]
-name = "core-graphics-types"
-version = "0.1.1"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "3a68b68b3446082644c91ac778bf50cd4104bfb002b5a6a7c44cca5a2c70788b"
-dependencies = [
- "bitflags 1.3.2",
- "core-foundation 0.9.3",
- "foreign-types 0.3.2",
+ "core-graphics-types",
+ "foreign-types",
  "libc",
 ]
 
@@ -727,16 +624,16 @@ version = "0.2.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
 checksum = "3d44a101f213f6c4cdc1853d4b78aef6db6bdfa3468798cc1d9912f4735013eb"
 dependencies = [
- "bitflags 2.8.0",
+ "bitflags 2.11.1",
  "core-foundation 0.10.1",
  "libc",
 ]
 
 [[package]]
 name = "cpufeatures"
-version = "0.2.5"
+version = "0.2.17"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "28d997bd5e24a5928dd43e46dc529867e207907fe0b239c3477d924f7f2ca320"
+checksum = "59ed5838eebb26a2bb2e58f6d5b5316989ae9d08bab10e0e6d103e656d1b0280"
 dependencies = [
  "libc",
 ]
@@ -752,28 +649,30 @@ dependencies = [
 
 [[package]]
 name = "crossbeam-channel"
-version = "0.5.6"
+version = "0.5.15"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "c2dd04ddaf88237dc3b8d8f9a3c1004b506b54b3313403944054d23c0870c521"
+checksum = "82b8f8f868b36967f9606790d1903570de9ceaf870a7bf9fbbd3016d636a2cb2"
 dependencies = [
- "cfg-if",
  "crossbeam-utils",
 ]
 
 [[package]]
 name = "crossbeam-utils"
-version = "0.8.14"
+version = "0.8.21"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "4fb766fa798726286dbbb842f174001dab8abc7b627a1dd86e0b7222a95d929f"
-dependencies = [
- "cfg-if",
-]
+checksum = "d0a5c400df2834b80a4c3327b3aad3a4c4cd4de0629063962b03235697506a28"
+
+[[package]]
+name = "crunchy"
+version = "0.2.4"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "460fbee9c2c2f33933d720630a6a0bac33ba7053db5344fac858d4b8952d77d5"
 
 [[package]]
 name = "crypto-common"
-version = "0.1.6"
+version = "0.1.7"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "1bfb12502f3fc46cca1bb51ac28df9d618d813cdc3d2f25b9fe775a34af26bb3"
+checksum = "78c8292055d1c1df0cce5d180393dc8cce0abec0a7102adb6c7b1eef6016d60a"
 dependencies = [
  "generic-array",
  "typenum",
@@ -781,46 +680,48 @@ dependencies = [
 
 [[package]]
 name = "cssparser"
-version = "0.29.6"
+version = "0.36.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "f93d03419cb5950ccfd3daf3ff1c7a36ace64609a1a8746d493df1ca0afde0fa"
+checksum = "dae61cf9c0abb83bd659dab65b7e4e38d8236824c85f0f804f173567bda257d2"
 dependencies = [
  "cssparser-macros",
  "dtoa-short",
  "itoa",
- "matches",
- "phf 0.10.1",
- "proc-macro2",
- "quote",
+ "phf",
  "smallvec",
- "syn 1.0.105",
 ]
 
 [[package]]
 name = "cssparser-macros"
-version = "0.6.0"
+version = "0.6.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "dfae75de57f2b2e85e8768c3ea840fd159c8f33e2b6522c7835b7abac81be16e"
+checksum = "13b588ba4ac1a99f7f2964d24b3d896ddc6bf847ee3855dbd4366f058cfcd331"
 dependencies = [
  "quote",
- "syn 1.0.105",
+ "syn 2.0.117",
 ]
 
 [[package]]
 name = "ctor"
-version = "0.2.8"
+version = "0.8.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "edb49164822f3ee45b17acd4a208cfc1251410cf0cad9a833234c9890774dd9f"
+checksum = "352d39c2f7bef1d6ad73db6f5160efcaed66d94ef8c6c573a8410c00bf909a98"
 dependencies = [
- "quote",
- "syn 2.0.106",
+ "ctor-proc-macro",
+ "dtor",
 ]
 
+[[package]]
+name = "ctor-proc-macro"
+version = "0.0.7"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "52560adf09603e58c9a7ee1fe1dcb95a16927b17c127f0ac02d6e768a0e25bc1"
+
 [[package]]
 name = "darling"
-version = "0.20.3"
+version = "0.23.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "0209d94da627ab5605dcccf08bb18afa5009cfbef48d8a8b7d7bdbc79be25c5e"
+checksum = "25ae13da2f202d56bd7f91c25fba009e7717a1e4a1cc98a76d844b65ae912e9d"
 dependencies = [
  "darling_core",
  "darling_macro",
@@ -828,75 +729,81 @@ dependencies = [
 
 [[package]]
 name = "darling_core"
-version = "0.20.3"
+version = "0.23.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "177e3443818124b357d8e76f53be906d60937f0d3a90773a664fa63fa253e621"
+checksum = "9865a50f7c335f53564bb694ef660825eb8610e0a53d3e11bf1b0d3df31e03b0"
 dependencies = [
- "fnv",
  "ident_case",
  "proc-macro2",
  "quote",
  "strsim",
- "syn 2.0.106",
+ "syn 2.0.117",
 ]
 
 [[package]]
 name = "darling_macro"
-version = "0.20.3"
+version = "0.23.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "836a9bbc7ad63342d6d6e7b815ccab164bc77a2d95d84bc3117a8c0d5c98e2d5"
+checksum = "ac3984ec7bd6cfa798e62b4a642426a5be0e68f9401cfc2a01e3fa9ea2fcdb8d"
 dependencies = [
  "darling_core",
  "quote",
- "syn 2.0.106",
+ "syn 2.0.117",
 ]
 
 [[package]]
 name = "data-url"
-version = "0.3.1"
+version = "0.3.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "5c297a1c74b71ae29df00c3e22dd9534821d60eb9af5a0192823fa2acea70c2a"
+checksum = "be1e0bca6c3637f992fc1cc7cbc52a78c1ef6db076dbf1059c4323d6a2048376"
 
 [[package]]
-name = "derivative"
-version = "2.2.0"
+name = "dbus"
+version = "0.9.11"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "fcc3dd5e9e9c0b295d6e1e4d811fb6f157d5ffd784b8d202fc62eac8035a770b"
+checksum = "b942602992bb7acfd1f51c49811c58a610ef9181b6e66f3e519d79b540a3bf73"
 dependencies = [
- "proc-macro2",
- "quote",
- "syn 1.0.105",
+ "libc",
+ "libdbus-sys",
+ "windows-sys 0.61.2",
 ]
 
 [[package]]
-name = "derive-new"
-version = "0.5.9"
+name = "deranged"
+version = "0.5.8"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "3418329ca0ad70234b9735dc4ceed10af4df60eff9c8e7b06cb5e520d92c3535"
+checksum = "7cd812cc2bc1d69d4764bd80df88b4317eaef9e773c75226407d9bc0876b211c"
 dependencies = [
- "proc-macro2",
- "quote",
- "syn 1.0.105",
+ "powerfmt",
+ "serde_core",
 ]
 
 [[package]]
 name = "derive_more"
-version = "0.99.17"
+version = "2.1.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "d751e9e49156b02b44f9c1815bcb94b984cdcc4396ecc32521c739452808b134"
+dependencies = [
+ "derive_more-impl",
+]
+
+[[package]]
+name = "derive_more-impl"
+version = "2.1.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "4fb810d30a7c1953f91334de7244731fc3f3c10d7fe163338a35b9f640960321"
+checksum = "799a97264921d8623a957f6c3b9011f3b5492f557bbb7a5a19b7fa6d06ba8dcb"
 dependencies = [
- "convert_case",
  "proc-macro2",
  "quote",
- "rustc_version 0.4.0",
- "syn 1.0.105",
+ "rustc_version",
+ "syn 2.0.117",
 ]
 
 [[package]]
 name = "digest"
-version = "0.10.6"
+version = "0.10.7"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "8168378f4e5023e7218c89c891c0fd8ecdb5e5e4f18cb78f38cf245dd021e76f"
+checksum = "9ed9a281f7bc9b7576e61468ba615a66a5c8cfdff42420a70aa82701a3b1e292"
 dependencies = [
  "block-buffer",
  "crypto-common",
@@ -920,23 +827,19 @@ dependencies = [
  "libc",
  "option-ext",
  "redox_users",
- "windows-sys 0.60.2",
+ "windows-sys 0.61.2",
 ]
 
-[[package]]
-name = "dispatch"
-version = "0.2.0"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "bd0c93bb4b0c6d9b77f4435b0ae98c24d17f1c45b2ff844c6151a07256ca923b"
-
 [[package]]
 name = "dispatch2"
-version = "0.3.0"
+version = "0.3.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "89a09f22a6c6069a18470eb92d2298acf25463f14256d24778e1230d789a2aec"
+checksum = "1e0e367e4e7da84520dedcac1901e4da967309406d1e51017ae1abfb97adbd38"
 dependencies = [
- "bitflags 2.8.0",
- "objc2 0.6.2",
+ "bitflags 2.11.1",
+ "block2",
+ "libc",
+ "objc2",
 ]
 
 [[package]]
@@ -947,23 +850,14 @@ checksum = "97369cbbc041bc366949bc74d34658d6cda5621039731c6310521892a3a20ae0"
 dependencies = [
  "proc-macro2",
  "quote",
- "syn 2.0.106",
-]
-
-[[package]]
-name = "dlib"
-version = "0.5.2"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "330c60081dcc4c72131f8eb70510f1ac07223e5d4163db481a04a0befcffa412"
-dependencies = [
- "libloading",
+ "syn 2.0.117",
 ]
 
 [[package]]
 name = "dlopen2"
-version = "0.8.0"
+version = "0.8.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "b54f373ccf864bf587a89e880fb7610f8d73f3045f13580948ccbcaff26febff"
+checksum = "5e2c5bd4158e66d1e215c49b837e11d62f3267b30c92f1d171c4d3105e3dc4d4"
 dependencies = [
  "dlopen2_derive",
  "libc",
@@ -973,24 +867,39 @@ dependencies = [
 
 [[package]]
 name = "dlopen2_derive"
-version = "0.4.1"
+version = "0.4.3"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "788160fb30de9cdd857af31c6a2675904b16ece8fc2737b2c7127ba368c9d0f4"
+checksum = "0fbbb781877580993a8707ec48672673ec7b81eeba04cfd2310bd28c08e47c8f"
 dependencies = [
  "proc-macro2",
  "quote",
- "syn 2.0.106",
+ "syn 2.0.117",
 ]
 
 [[package]]
 name = "document-features"
-version = "0.2.11"
+version = "0.2.12"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "95249b50c6c185bee49034bcb378a49dc2b5dff0be90ff6616d31d64febab05d"
+checksum = "d4b8a88685455ed29a21542a33abd9cb6510b6b129abadabdcef0f4c55bc8f61"
 dependencies = [
  "litrs",
 ]
 
+[[package]]
+name = "dom_query"
+version = "0.27.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "521e380c0c8afb8d9a1e83a1822ee03556fc3e3e7dbc1fd30be14e37f9cb3f89"
+dependencies = [
+ "bit-set",
+ "cssparser",
+ "foldhash 0.2.0",
+ "html5ever",
+ "precomputed-hash",
+ "selectors",
+ "tendril",
+]
+
 [[package]]
 name = "downcast-rs"
 version = "1.2.1"
@@ -1008,24 +917,39 @@ dependencies = [
 
 [[package]]
 name = "dtoa"
-version = "0.4.8"
+version = "1.0.11"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "56899898ce76aaf4a0f24d914c97ea6ed976d42fec6ad33fcbb0a1103e07b2b0"
+checksum = "4c3cf4824e2d5f025c7b531afcb2325364084a16806f6d47fbc1f5fbd9960590"
 
 [[package]]
 name = "dtoa-short"
-version = "0.3.3"
+version = "0.3.5"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "bde03329ae10e79ede66c9ce4dc930aa8599043b0743008548680f25b91502d6"
+checksum = "cd1511a7b6a56299bd043a9c167a6d2bfb37bf84a6dfceaba651168adfb43c87"
 dependencies = [
  "dtoa",
 ]
 
+[[package]]
+name = "dtor"
+version = "0.3.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "f1057d6c64987086ff8ed0fd3fbf377a6b7d205cc7715868cd401705f715cbe4"
+dependencies = [
+ "dtor-proc-macro",
+]
+
+[[package]]
+name = "dtor-proc-macro"
+version = "0.0.6"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "f678cf4a922c215c63e0de95eb1ff08a958a81d47e485cf9da1e27bf6305cfa5"
+
 [[package]]
 name = "dunce"
-version = "1.0.3"
+version = "1.0.5"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "0bd4b30a6560bbd9b4620f4de34c3f14f60848e58a9b7216801afcb4c7b31c3c"
+checksum = "92773504d58c093f6de2459af4af33faa518c13451eb8f2b5698ed3d36e7c813"
 
 [[package]]
 name = "dyn-clone"
@@ -1035,16 +959,16 @@ checksum = "d0881ea181b1df73ff77ffaaf9c7544ecc11e82fba9b5f27b262a3c73a332555"
 
 [[package]]
 name = "embed-resource"
-version = "3.0.5"
+version = "3.0.9"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "4c6d81016d6c977deefb2ef8d8290da019e27cc26167e102185da528e6c0ab38"
+checksum = "c31a88c8d26de40ed18fe748c547845aa39de1db3afd958f8cb91579f3644bcb"
 dependencies = [
  "cc",
  "memchr",
- "rustc_version 0.4.0",
- "toml 0.9.5",
+ "rustc_version",
+ "toml 1.1.2+spec-1.1.0",
  "vswhom",
- "winreg 0.55.0",
+ "winreg",
 ]
 
 [[package]]
@@ -1064,9 +988,9 @@ dependencies = [
 
 [[package]]
 name = "endi"
-version = "1.1.0"
+version = "1.1.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "a3d8a32ae18130a3c84dd492d4215c3d913c3b07c6b63c2eb3eb7ff1101ab7bf"
+checksum = "66b7e2430c6dff6a955451e2cfc438f09cea1965a9d6f87f7e3b90decc014099"
 
 [[package]]
 name = "enumflags2"
@@ -1086,44 +1010,41 @@ checksum = "67c78a4d8fdf9953a5c9d458f9efe940fd97a0cab0941c075a813ac594733827"
 dependencies = [
  "proc-macro2",
  "quote",
- "syn 2.0.106",
+ "syn 2.0.117",
 ]
 
 [[package]]
 name = "equivalent"
-version = "1.0.1"
+version = "1.0.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "5443807d6dff69373d433ab9ef5378ad8df50ca6298caf15de6e52e24aaf54d5"
+checksum = "877a4ace8713b0bcf2a4e7eec82529c029f1d0619886d18145fea96c3ffe5c0f"
 
 [[package]]
 name = "erased-serde"
-version = "0.4.6"
+version = "0.4.10"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "e004d887f51fcb9fef17317a2f3525c887d8aa3f4f50fed920816a688284a5b7"
+checksum = "d2add8a07dd6a8d93ff627029c51de145e12686fbc36ecb298ac22e74cf02dec"
 dependencies = [
  "serde",
+ "serde_core",
  "typeid",
 ]
 
 [[package]]
 name = "errno"
-version = "0.3.13"
+version = "0.3.14"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "778e2ac28f6c47af28e4907f13ffd1e1ddbd400980a9abd7c8df189bf578a5ad"
+checksum = "39cab71617ae0d63f51a36d69f866391735b51691dbda63cf6f96d042b63efeb"
 dependencies = [
  "libc",
- "windows-sys 0.60.2",
+ "windows-sys 0.61.2",
 ]
 
 [[package]]
 name = "error-code"
-version = "2.3.1"
+version = "3.3.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "64f18991e7bf11e7ffee451b5318b5c1a73c52d0d0ada6e5a3017c8c1ced6a21"
-dependencies = [
- "libc",
- "str-buf",
-]
+checksum = "dea2df4cf52843e0452895c455a1a2cfbb842a1e7329671acf418fdc53ed4c59"
 
 [[package]]
 name = "event-listener"
@@ -1148,40 +1069,52 @@ dependencies = [
 
 [[package]]
 name = "fastrand"
-version = "1.8.0"
+version = "2.4.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "a7a407cfaa3385c4ae6b23e84623d48c2798d06e3e6a1878f7f59f17b3f86499"
-dependencies = [
- "instant",
-]
+checksum = "9f1f227452a390804cdb637b74a86990f2a7d7ba4b7d5693aac9b4dd6defd8d6"
 
 [[package]]
-name = "fastrand"
-version = "2.3.0"
+name = "fax"
+version = "0.2.7"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "caf1079563223d5d59d83c85886a56e586cfd5c1a26292e971a0fa266531ac5a"
+
+[[package]]
+name = "fdeflate"
+version = "0.3.7"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "37909eebbb50d72f9059c3b6d82c0463f2ff062c9e95845c43a6c9c0355411be"
+checksum = "1e6853b52649d4ac5c0bd02320cddc5ba956bdb407c4b75a2c6b75bf51500f8c"
+dependencies = [
+ "simd-adler32",
+]
 
 [[package]]
 name = "field-offset"
-version = "0.3.4"
+version = "0.3.6"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "1e1c54951450cbd39f3dbcf1005ac413b49487dabf18a720ad2383eccfeffb92"
+checksum = "38e2275cc4e4fc009b0669731a1e5ab7ebf11f469eaede2bab9309a5b4d6057f"
 dependencies = [
- "memoffset 0.6.5",
- "rustc_version 0.3.3",
+ "memoffset",
+ "rustc_version",
 ]
 
+[[package]]
+name = "find-msvc-tools"
+version = "0.1.9"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "5baebc0774151f905a1a2cc41989300b1e6fbb29aff0ceffa1064fdd3088d582"
+
 [[package]]
 name = "fixedbitset"
-version = "0.4.2"
+version = "0.5.7"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "0ce7134b9999ecaf8bcd65542e436736ef32ddca1b3e06094cb6ec5755203b80"
+checksum = "1d674e81391d1e1ab681a28d99df07927c6d4aa5b027d7da16ba32d1d21ecd99"
 
 [[package]]
 name = "flate2"
-version = "1.0.25"
+version = "1.1.9"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "a8a2db397cb1c8772f31494cb8917e48cd1e64f0fa7efac59fbd741a0a8ce841"
+checksum = "843fba2746e448b37e26a819579957415c8cef339bf08564fe8b7ddbd959573c"
 dependencies = [
  "crc32fast",
  "miniz_oxide",
@@ -1194,22 +1127,25 @@ source = "registry+https://github.com/rust-lang/crates.io-index"
 checksum = "3f9eec918d3f24069decb9af1554cad7c880e2da24a9afd88aca000531ab82c1"
 
 [[package]]
-name = "foreign-types"
-version = "0.3.2"
+name = "foldhash"
+version = "0.1.5"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "f6f339eb8adc052cd2ca78910fda869aefa38d22d5cb648e6485e4d3fc06f3b1"
-dependencies = [
- "foreign-types-shared 0.1.1",
-]
+checksum = "d9c4f5dac5e15c24eb999c26181a6ca40b39fe946cbe4c263c7209467bc83af2"
 
 [[package]]
-name = "foreign-types"
+name = "foldhash"
+version = "0.2.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "77ce24cb58228fbb8aa041425bb1050850ac19177686ea6e0f41a70416f56fdb"
+
+[[package]]
+name = "foreign-types"
 version = "0.5.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
 checksum = "d737d9aa519fb7b749cbc3b962edcf310a8dd1f4b67c91c4f83975dbdd17d965"
 dependencies = [
  "foreign-types-macros",
- "foreign-types-shared 0.3.1",
+ "foreign-types-shared",
 ]
 
 [[package]]
@@ -1220,15 +1156,9 @@ checksum = "1a5c6c585bc94aaf2c7b51dd4c2ba22680844aba4c687be581871a6f518c5742"
 dependencies = [
  "proc-macro2",
  "quote",
- "syn 2.0.106",
+ "syn 2.0.117",
 ]
 
-[[package]]
-name = "foreign-types-shared"
-version = "0.1.1"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "00b0228411908ca8685dba7fc2cdd70ec9990a6e753e89b6ac91a84c40fbaf4b"
-
 [[package]]
 name = "foreign-types-shared"
 version = "0.3.1"
@@ -1237,43 +1167,33 @@ checksum = "aa9a19cbb55df58761df49b23516a86d432839add4af60fc256da840f66ed35b"
 
 [[package]]
 name = "form_urlencoded"
-version = "1.2.1"
+version = "1.2.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "e13624c2627564efccf4934284bdd98cbaa14e79b0b5a141218e507b3a823456"
+checksum = "cb4cb245038516f5f85277875cdaa4f7d2c9a0fa0468de06ed190163b1581fcf"
 dependencies = [
  "percent-encoding",
 ]
 
-[[package]]
-name = "futf"
-version = "0.1.5"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "df420e2e84819663797d1ec6544b13c5be84629e7bb00dc960d6917db2987843"
-dependencies = [
- "mac",
- "new_debug_unreachable",
-]
-
 [[package]]
 name = "futures-channel"
-version = "0.3.25"
+version = "0.3.32"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "52ba265a92256105f45b719605a571ffe2d1f0fea3807304b522c1d778f79eed"
+checksum = "07bbe89c50d7a535e539b8c17bc0b49bdb77747034daa8087407d655f3f7cc1d"
 dependencies = [
  "futures-core",
 ]
 
 [[package]]
 name = "futures-core"
-version = "0.3.31"
+version = "0.3.32"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "05f29059c0c2090612e8d742178b0580d2dc940c837851ad723096f87af6663e"
+checksum = "7e3450815272ef58cec6d564423f6e755e25379b217b0bc688e295ba24df6b1d"
 
 [[package]]
 name = "futures-executor"
-version = "0.3.25"
+version = "0.3.32"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "7acc85df6714c176ab5edf386123fafe217be88c0840ec11f199441134a074e2"
+checksum = "baf29c38818342a3b26b5b923639e7b1f4a61fc5e76102d4b1981c6dc7a7579d"
 dependencies = [
  "futures-core",
  "futures-task",
@@ -1282,9 +1202,9 @@ dependencies = [
 
 [[package]]
 name = "futures-io"
-version = "0.3.31"
+version = "0.3.32"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "9e5c1b78ca4aae1ac06c48a526a655760685149f0d465d21f37abfe57ce075c6"
+checksum = "cecba35d7ad927e23624b22ad55235f2239cfa44fd10428eecbeba6d6a717718"
 
 [[package]]
 name = "futures-lite"
@@ -1292,7 +1212,7 @@ version = "2.6.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
 checksum = "f78e10609fe0e0b3f4157ffab1876319b5b0db102a2c60dc4626306dc46b44ad"
 dependencies = [
- "fastrand 2.3.0",
+ "fastrand",
  "futures-core",
  "futures-io",
  "parking",
@@ -1301,32 +1221,32 @@ dependencies = [
 
 [[package]]
 name = "futures-macro"
-version = "0.3.31"
+version = "0.3.32"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "162ee34ebcb7c64a8abebc059ce0fee27c2262618d7b60ed8faf72fef13c3650"
+checksum = "e835b70203e41293343137df5c0664546da5745f82ec9b84d40be8336958447b"
 dependencies = [
  "proc-macro2",
  "quote",
- "syn 2.0.106",
+ "syn 2.0.117",
 ]
 
 [[package]]
 name = "futures-sink"
-version = "0.3.31"
+version = "0.3.32"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "e575fab7d1e0dcb8d0c7bcf9a63ee213816ab51902e6d244a95819acacf1d4f7"
+checksum = "c39754e157331b013978ec91992bde1ac089843443c49cbc7f46150b0fad0893"
 
 [[package]]
 name = "futures-task"
-version = "0.3.31"
+version = "0.3.32"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "f90f7dce0722e95104fcb095585910c0977252f286e354b5e3bd38902cd99988"
+checksum = "037711b3d59c33004d3856fbdc83b99d4ff37a24768fa1be9ce3538a1cde4393"
 
 [[package]]
 name = "futures-util"
-version = "0.3.31"
+version = "0.3.32"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "9fa08315bb612088cc391249efdc3bc77536f16c91f6cf495e6fbe85b20a4a81"
+checksum = "389ca41296e6190b48053de0321d02a77f32f8a5d2461dd38762c0593805c6d6"
 dependencies = [
  "futures-core",
  "futures-io",
@@ -1335,19 +1255,9 @@ dependencies = [
  "futures-task",
  "memchr",
  "pin-project-lite",
- "pin-utils",
  "slab",
 ]
 
-[[package]]
-name = "fxhash"
-version = "0.2.1"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "c31b6d751ae2c7f11320402d34e41349dd1016f8d5d45e48c4312bc8625af50c"
-dependencies = [
- "byteorder",
-]
-
 [[package]]
 name = "gdk"
 version = "0.18.2"
@@ -1449,9 +1359,9 @@ dependencies = [
 
 [[package]]
 name = "generic-array"
-version = "0.14.6"
+version = "0.14.7"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "bff49e947297f3312447abdca79f45f4738097cc82b06e72054d2223f601f1b9"
+checksum = "85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a"
 dependencies = [
  "typenum",
  "version_check",
@@ -1459,66 +1369,52 @@ dependencies = [
 
 [[package]]
 name = "gethostname"
-version = "0.2.3"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "c1ebd34e35c46e00bb73e81363248d627782724609fe1b6396f553f68fe3862e"
-dependencies = [
- "libc",
- "winapi",
-]
-
-[[package]]
-name = "gethostname"
-version = "0.4.3"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "0176e0459c2e4a1fe232f984bca6890e681076abb9934f6cea7c326f3fc47818"
-dependencies = [
- "libc",
- "windows-targets 0.48.5",
-]
-
-[[package]]
-name = "gethostname"
-version = "1.0.2"
+version = "1.1.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "fc257fdb4038301ce4b9cd1b3b51704509692bb3ff716a410cbd07925d9dae55"
+checksum = "1bd49230192a3797a9a4d6abe9b3eed6f7fa4c8a8a4947977c6f80025f92cbd8"
 dependencies = [
- "rustix 1.0.8",
- "windows-targets 0.52.6",
+ "rustix",
+ "windows-link 0.2.1",
 ]
 
 [[package]]
 name = "getrandom"
-version = "0.1.16"
+version = "0.2.17"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "8fc3cb4d91f53b50155bdcfd23f6a4c39ae1969c2ae85982b135750cccaf5fce"
+checksum = "ff2abc00be7fca6ebc474524697ae276ad847ad0a6b3faa4bcb027e9a4614ad0"
 dependencies = [
  "cfg-if",
+ "js-sys",
  "libc",
- "wasi 0.9.0+wasi-snapshot-preview1",
+ "wasi",
+ "wasm-bindgen",
 ]
 
 [[package]]
 name = "getrandom"
-version = "0.2.8"
+version = "0.3.4"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "c05aeb6a22b8f62540c194aac980f2115af067bfe15a0734d7277a768d396b31"
+checksum = "899def5c37c4fd7b2664648c28120ecec138e4d395b459e5ca34f9cce2dd77fd"
 dependencies = [
  "cfg-if",
+ "js-sys",
  "libc",
- "wasi 0.11.0+wasi-snapshot-preview1",
+ "r-efi 5.3.0",
+ "wasip2",
+ "wasm-bindgen",
 ]
 
 [[package]]
 name = "getrandom"
-version = "0.3.3"
+version = "0.4.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "26145e563e54f2cadc477553f1ec5ee650b00862f0a58bcd12cbdc5f0ea2d2f4"
+checksum = "0de51e6874e94e7bf76d726fc5d13ba782deca734ff60d5bb2fb2607c7406555"
 dependencies = [
  "cfg-if",
  "libc",
- "r-efi",
- "wasi 0.14.2+wasi-0.2.4",
+ "r-efi 6.0.0",
+ "wasip2",
+ "wasip3",
 ]
 
 [[package]]
@@ -1537,7 +1433,7 @@ dependencies = [
  "once_cell",
  "pin-project-lite",
  "smallvec",
- "thiserror 1.0.50",
+ "thiserror 1.0.69",
 ]
 
 [[package]]
@@ -1559,7 +1455,7 @@ version = "0.18.5"
 source = "registry+https://github.com/rust-lang/crates.io-index"
 checksum = "233daaf6e83ae6a12a52055f568f9d7cf4671dabb78ff9560ab6da230ce00ee5"
 dependencies = [
- "bitflags 2.8.0",
+ "bitflags 2.11.1",
  "futures-channel",
  "futures-core",
  "futures-executor",
@@ -1573,7 +1469,7 @@ dependencies = [
  "memchr",
  "once_cell",
  "smallvec",
- "thiserror 1.0.50",
+ "thiserror 1.0.69",
 ]
 
 [[package]]
@@ -1582,12 +1478,12 @@ version = "0.18.5"
 source = "registry+https://github.com/rust-lang/crates.io-index"
 checksum = "0bb0228f477c0900c880fd78c8759b95c7636dbd7842707f49e132378aa2acdc"
 dependencies = [
- "heck 0.4.0",
+ "heck 0.4.1",
  "proc-macro-crate 2.0.2",
  "proc-macro-error",
  "proc-macro2",
  "quote",
- "syn 2.0.106",
+ "syn 2.0.117",
 ]
 
 [[package]]
@@ -1614,13 +1510,13 @@ checksum = "b9247516746aa8e53411a0db9b62b0e24efbcf6a76e0ba73e5a91b512ddabed7"
 dependencies = [
  "crossbeam-channel",
  "keyboard-types",
- "objc2 0.6.2",
- "objc2-app-kit 0.3.1",
+ "objc2",
+ "objc2-app-kit",
  "once_cell",
  "serde",
- "thiserror 2.0.15",
+ "thiserror 2.0.18",
  "windows-sys 0.59.0",
- "x11rb 0.13.1",
+ "x11rb",
  "xkeysym",
 ]
 
@@ -1680,18 +1576,18 @@ version = "0.18.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
 checksum = "52ff3c5b21f14f0736fed6dcfc0bfb4225ebf5725f3c0209edeec181e4d73e9d"
 dependencies = [
- "proc-macro-crate 1.2.1",
+ "proc-macro-crate 1.3.1",
  "proc-macro-error",
  "proc-macro2",
  "quote",
- "syn 2.0.106",
+ "syn 2.0.117",
 ]
 
 [[package]]
 name = "h2"
-version = "0.4.12"
+version = "0.4.14"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "f3c0b69cfcb4e1b9f1bf2f53f95f766e4661169728ec61cd3fe5a0166f2d1386"
+checksum = "171fefbc92fe4a4de27e0698d6a5b392d6a0e333506bc49133760b3bcf948733"
 dependencies = [
  "atomic-waker",
  "bytes",
@@ -1699,13 +1595,24 @@ dependencies = [
  "futures-core",
  "futures-sink",
  "http",
- "indexmap 2.10.0",
+ "indexmap 2.14.0",
  "slab",
  "tokio",
  "tokio-util",
  "tracing",
 ]
 
+[[package]]
+name = "half"
+version = "2.7.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "6ea2d84b969582b4b1864a92dc5d27cd2b77b622a8d79306834f1be5ba20d84b"
+dependencies = [
+ "cfg-if",
+ "crunchy",
+ "zerocopy",
+]
+
 [[package]]
 name = "hashbrown"
 version = "0.12.3"
@@ -1717,27 +1624,27 @@ name = "hashbrown"
 version = "0.15.5"
 source = "registry+https://github.com/rust-lang/crates.io-index"
 checksum = "9229cfe53dfd69f0609a49f65461bd93001ea1ef889cd5529dd176593f5338a1"
+dependencies = [
+ "foldhash 0.1.5",
+]
 
 [[package]]
-name = "heck"
-version = "0.4.0"
+name = "hashbrown"
+version = "0.17.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "2540771e65fc8cb83cd6e8a237f70c319bd5c29f78ed1084ba5d50eeac86f7f9"
+checksum = "4f467dd6dccf739c208452f8014c75c18bb8301b050ad1cfb27153803edb0f51"
 
 [[package]]
 name = "heck"
-version = "0.5.0"
+version = "0.4.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
+checksum = "95505c38b4572b2d910cecb0281560f54b440a19336cbbcb27bf6ce6adc6f5a8"
 
 [[package]]
-name = "hermit-abi"
-version = "0.1.19"
+name = "heck"
+version = "0.5.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "62b467343b94ba476dcb2500d242dadbb39557df889310ac77c5d99100aaac33"
-dependencies = [
- "libc",
-]
+checksum = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
 
 [[package]]
 name = "hermit-abi"
@@ -1751,35 +1658,23 @@ version = "0.4.3"
 source = "registry+https://github.com/rust-lang/crates.io-index"
 checksum = "7f24254aa9a54b5c858eaee2f5bccdb46aaf0e486a595ed5fd8f86ba55232a70"
 
-[[package]]
-name = "home"
-version = "0.5.9"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "e3d1354bf6b7235cb4a0576c2619fd4ed18183f689b12b006a0ee7329eeff9a5"
-dependencies = [
- "windows-sys 0.52.0",
-]
-
 [[package]]
 name = "html5ever"
-version = "0.29.1"
+version = "0.38.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "3b7410cae13cbc75623c98ac4cbfd1f0bedddf3227afc24f370cf0f50a44a11c"
+checksum = "1054432bae2f14e0061e33d23402fbaa67a921d319d56adc6bcf887ddad1cbc2"
 dependencies = [
  "log",
- "mac",
  "markup5ever",
- "match_token",
 ]
 
 [[package]]
 name = "http"
-version = "1.3.1"
+version = "1.4.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "f4a85d31aea989eead29a3aaf9e1115a180df8282431156e533de47660892565"
+checksum = "e3ba2a386d7f85a81f119ad7498ebe444d2e22c2af0b86b069416ace48b3311a"
 dependencies = [
  "bytes",
- "fnv",
  "itoa",
 ]
 
@@ -1820,9 +1715,9 @@ checksum = "df3b46402a9d5adb4c86a0cf463f42e19994e3ee891101b1841f30a545cb49a9"
 
 [[package]]
 name = "hyper"
-version = "1.7.0"
+version = "1.9.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "eb3aa54a13a0dfe7fbe3a59e0c76093041720fdc77b110cc0fc260fafb4dc51e"
+checksum = "6299f016b246a94207e63da54dbe807655bf9e00044f73ded42c3ac5305fbcca"
 dependencies = [
  "atomic-waker",
  "bytes",
@@ -1834,7 +1729,6 @@ dependencies = [
  "httparse",
  "itoa",
  "pin-project-lite",
- "pin-utils",
  "smallvec",
  "tokio",
  "want",
@@ -1842,53 +1736,58 @@ dependencies = [
 
 [[package]]
 name = "hyper-rustls"
-version = "0.26.0"
+version = "0.27.9"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "a0bea761b46ae2b24eb4aef630d8d1c398157b6fc29e6350ecf090a0b70c952c"
+checksum = "33ca68d021ef39cf6463ab54c1d0f5daf03377b70561305bb89a8f83aab66e0f"
 dependencies = [
- "futures-util",
  "http",
  "hyper",
  "hyper-util",
  "rustls",
- "rustls-pki-types",
  "tokio",
  "tokio-rustls",
  "tower-service",
+ "webpki-roots",
 ]
 
 [[package]]
 name = "hyper-util"
-version = "0.1.7"
+version = "0.1.20"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "cde7055719c54e36e95e8719f95883f22072a48ede39db7fc17a4e1d5281e9b9"
+checksum = "96547c2556ec9d12fb1578c4eaf448b04993e7fb79cbaad930a656880a6bdfa0"
 dependencies = [
+ "base64 0.22.1",
  "bytes",
  "futures-channel",
  "futures-util",
  "http",
  "http-body",
  "hyper",
+ "ipnet",
+ "libc",
+ "percent-encoding",
  "pin-project-lite",
- "socket2 0.5.10",
+ "socket2",
+ "system-configuration",
  "tokio",
- "tower",
  "tower-service",
  "tracing",
+ "windows-registry",
 ]
 
 [[package]]
 name = "iana-time-zone"
-version = "0.1.58"
+version = "0.1.65"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "8326b86b6cff230b97d0d312a6c40a60726df3332e721f72a1b035f451663b20"
+checksum = "e31bc9ad994ba00e440a8aa5c9ef0ec67d5cb5e5cb0cc7f8b744a35b389cc470"
 dependencies = [
  "android_system_properties",
  "core-foundation-sys",
  "iana-time-zone-haiku",
  "js-sys",
+ "log",
  "wasm-bindgen",
- "windows-core 0.51.1",
+ "windows-core 0.62.2",
 ]
 
 [[package]]
@@ -1902,22 +1801,23 @@ dependencies = [
 
 [[package]]
 name = "ico"
-version = "0.4.0"
+version = "0.5.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "cc50b891e4acf8fe0e71ef88ec43ad82ee07b3810ad09de10f1d01f072ed4b98"
+checksum = "3e795dff5605e0f04bff85ca41b51a96b83e80b281e96231bcaaf1ac35103371"
 dependencies = [
  "byteorder",
- "png",
+ "png 0.17.16",
 ]
 
 [[package]]
 name = "icu_collections"
-version = "2.0.0"
+version = "2.2.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "200072f5d0e3614556f94a9930d5dc3e0662a652823904c3a75dc3b0af7fee47"
+checksum = "2984d1cd16c883d7935b9e07e44071dca8d917fd52ecc02c04d5fa0b5a3f191c"
 dependencies = [
  "displaydoc",
  "potential_utf",
+ "utf8_iter",
  "yoke",
  "zerofrom",
  "zerovec",
@@ -1925,9 +1825,9 @@ dependencies = [
 
 [[package]]
 name = "icu_locale_core"
-version = "2.0.0"
+version = "2.2.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "0cde2700ccaed3872079a65fb1a78f6c0a36c91570f28755dda67bc8f7d9f00a"
+checksum = "92219b62b3e2b4d88ac5119f8904c10f8f61bf7e95b640d25ba3075e6cac2c29"
 dependencies = [
  "displaydoc",
  "litemap",
@@ -1938,11 +1838,10 @@ dependencies = [
 
 [[package]]
 name = "icu_normalizer"
-version = "2.0.0"
+version = "2.2.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "436880e8e18df4d7bbc06d58432329d6458cc84531f7ac5f024e93deadb37979"
+checksum = "c56e5ee99d6e3d33bd91c5d85458b6005a22140021cc324cea84dd0e72cff3b4"
 dependencies = [
- "displaydoc",
  "icu_collections",
  "icu_normalizer_data",
  "icu_properties",
@@ -1953,42 +1852,38 @@ dependencies = [
 
 [[package]]
 name = "icu_normalizer_data"
-version = "2.0.0"
+version = "2.2.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "00210d6893afc98edb752b664b8890f0ef174c8adbb8d0be9710fa66fbbf72d3"
+checksum = "da3be0ae77ea334f4da67c12f149704f19f81d1adf7c51cf482943e84a2bad38"
 
 [[package]]
 name = "icu_properties"
-version = "2.0.1"
+version = "2.2.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "016c619c1eeb94efb86809b015c58f479963de65bdb6253345c1a1276f22e32b"
+checksum = "bee3b67d0ea5c2cca5003417989af8996f8604e34fb9ddf96208a033901e70de"
 dependencies = [
- "displaydoc",
  "icu_collections",
  "icu_locale_core",
  "icu_properties_data",
  "icu_provider",
- "potential_utf",
  "zerotrie",
  "zerovec",
 ]
 
 [[package]]
 name = "icu_properties_data"
-version = "2.0.1"
+version = "2.2.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "298459143998310acd25ffe6810ed544932242d3f07083eee1084d83a71bd632"
+checksum = "8e2bbb201e0c04f7b4b3e14382af113e17ba4f63e2c9d2ee626b720cbce54a14"
 
 [[package]]
 name = "icu_provider"
-version = "2.0.0"
+version = "2.2.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "03c80da27b5f4187909049ee2d72f276f0d9f99a42c306bd0131ecfe04d8e5af"
+checksum = "139c4cf31c8b5f33d7e199446eff9c1e02decfc2f0eec2c8d71f65befa45b421"
 dependencies = [
  "displaydoc",
  "icu_locale_core",
- "stable_deref_trait",
- "tinystr",
  "writeable",
  "yoke",
  "zerofrom",
@@ -1997,26 +1892,22 @@ dependencies = [
 ]
 
 [[package]]
-name = "ident_case"
-version = "1.0.1"
+name = "id-arena"
+version = "2.3.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "b9e0384b61958566e926dc50660321d12159025e767c18e043daf26b70104c39"
+checksum = "3d3067d79b975e8844ca9eb072e16b31c3c1c36928edf9c6789548c524d0d954"
 
 [[package]]
-name = "idna"
-version = "0.3.0"
+name = "ident_case"
+version = "1.0.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "e14ddfc70884202db2244c223200c204c2bda1bc6e0998d11b5e024d657209e6"
-dependencies = [
- "unicode-bidi",
- "unicode-normalization",
-]
+checksum = "b9e0384b61958566e926dc50660321d12159025e767c18e043daf26b70104c39"
 
 [[package]]
 name = "idna"
-version = "1.0.3"
+version = "1.1.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "686f825264d630750a544639377bae737628043f20d38bbc029e8f29ea968a7e"
+checksum = "3b0875f23caa03898994f6ddc501886a45c7d3d62d04d2d90788d47be1b1e4de"
 dependencies = [
  "idna_adapter",
  "smallvec",
@@ -2025,9 +1916,9 @@ dependencies = [
 
 [[package]]
 name = "idna_adapter"
-version = "1.2.1"
+version = "1.2.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "3acae9609540aa318d1bc588455225fb2085b9ed0c4f6bd0d9d5bcd86f1a0344"
+checksum = "cb68373c0d6620ef8105e855e7745e18b0d00d3bdb07fb532e434244cdb9a714"
 dependencies = [
  "icu_normalizer",
  "icu_properties",
@@ -2035,24 +1926,23 @@ dependencies = [
 
 [[package]]
 name = "image"
-version = "0.24.5"
+version = "0.25.10"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "69b7ea949b537b0fd0af141fff8c77690f2ce96f4f41f042ccb6c69c6c965945"
+checksum = "85ab80394333c02fe689eaf900ab500fbd0c2213da414687ebf995a65d5a6104"
 dependencies = [
  "bytemuck",
- "byteorder",
- "color_quant",
- "num-rational",
+ "byteorder-lite",
+ "moxcms",
  "num-traits",
- "png",
+ "png 0.18.1",
  "tiff",
 ]
 
 [[package]]
 name = "indexmap"
-version = "1.9.2"
+version = "1.9.3"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "1885e79c1fc4b10f0e172c475f458b7f7b93061064d98c3293e98c5ba0c8b399"
+checksum = "bd070e393353796e801d209ad339e89596eb4c8d430d18ede6a1cced8fafbd99"
 dependencies = [
  "autocfg",
  "hashbrown 0.12.3",
@@ -2061,13 +1951,14 @@ dependencies = [
 
 [[package]]
 name = "indexmap"
-version = "2.10.0"
+version = "2.14.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "fe4cd85333e22411419a0bcae1297d25e58c9443848b11dc6a86fefe8c78a661"
+checksum = "d466e9454f08e4a911e14806c24e16fba1b4c121d1ea474396f396069cf949d9"
 dependencies = [
  "equivalent",
- "hashbrown 0.15.5",
+ "hashbrown 0.17.0",
  "serde",
+ "serde_core",
 ]
 
 [[package]]
@@ -2079,20 +1970,11 @@ dependencies = [
  "cfb",
 ]
 
-[[package]]
-name = "instant"
-version = "0.1.12"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "7a5bbe824c507c5da5956355e86a746d82e0e1464f65d862cc5e71da70e94b2c"
-dependencies = [
- "cfg-if",
-]
-
 [[package]]
 name = "ipnet"
-version = "2.9.0"
+version = "2.12.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "8f518f335dce6725a761382244631d86cf0ccb2863413590b31338feb467f9c3"
+checksum = "d98f6fed1fde3f8c21bc40a1abb88dd75e67924f9cffc3ef95607bad8017f8e2"
 
 [[package]]
 name = "is-docker"
@@ -2115,9 +1997,9 @@ dependencies = [
 
 [[package]]
 name = "itoa"
-version = "1.0.4"
+version = "1.0.18"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "4217ad341ebadf8d8e724e264f13e593e0648f5b3e94b3896a5df283be015ecc"
+checksum = "8f42a60cbdf9a97f5d2305f08a87dc4e09308d1276d28c869c684d7777685682"
 
 [[package]]
 name = "javascriptcore-rs"
@@ -2151,31 +2033,49 @@ dependencies = [
  "cesu8",
  "cfg-if",
  "combine",
- "jni-sys",
+ "jni-sys 0.3.1",
  "log",
- "thiserror 1.0.50",
+ "thiserror 1.0.69",
  "walkdir",
  "windows-sys 0.45.0",
 ]
 
 [[package]]
 name = "jni-sys"
-version = "0.3.0"
+version = "0.3.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "8eaf4bc02d17cbdd7ff4c7438cafcdf7fb9a4613313ad11b4f8fefe7d3fa0130"
+checksum = "41a652e1f9b6e0275df1f15b32661cf0d4b78d4d87ddec5e0c3c20f097433258"
+dependencies = [
+ "jni-sys 0.4.1",
+]
 
 [[package]]
-name = "jpeg-decoder"
-version = "0.3.1"
+name = "jni-sys"
+version = "0.4.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "c6377a88cb3910bee9b0fa88d4f42e1d2da8e79915598f65fb0c7ee14c878af2"
+dependencies = [
+ "jni-sys-macros",
+]
+
+[[package]]
+name = "jni-sys-macros"
+version = "0.4.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "f5d4a7da358eff58addd2877a45865158f0d78c911d43a5784ceb7bbf52833b0"
+checksum = "38c0b942f458fe50cdac086d2f946512305e5631e720728f2a61aabcd47a6264"
+dependencies = [
+ "quote",
+ "syn 2.0.117",
+]
 
 [[package]]
 name = "js-sys"
-version = "0.3.77"
+version = "0.3.98"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "1cfaf33c695fc6e08064efbc1f72ec937429614f25eef83af942d0e227c3a28f"
+checksum = "67df7112613f8bfd9150013a0314e196f4800d3201ae742489d999db2f979f08"
 dependencies = [
+ "cfg-if",
+ "futures-util",
  "once_cell",
  "wasm-bindgen",
 ]
@@ -2189,7 +2089,7 @@ dependencies = [
  "jsonptr",
  "serde",
  "serde_json",
- "thiserror 1.0.50",
+ "thiserror 1.0.69",
 ]
 
 [[package]]
@@ -2208,28 +2108,16 @@ version = "0.7.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
 checksum = "b750dcadc39a09dbadd74e118f6dd6598df77fa01df0cfcdc52c28dece74528a"
 dependencies = [
- "bitflags 2.8.0",
+ "bitflags 2.11.1",
  "serde",
  "unicode-segmentation",
 ]
 
 [[package]]
-name = "kuchikiki"
-version = "0.8.8-speedreader"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "02cb977175687f33fa4afa0c95c112b987ea1443e5a51c8f8ff27dc618270cc2"
-dependencies = [
- "cssparser",
- "html5ever",
- "indexmap 2.10.0",
- "selectors",
-]
-
-[[package]]
-name = "lazy_static"
-version = "1.4.0"
+name = "leb128fmt"
+version = "0.1.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "e2abad23fbc42b3700f2f279844dc832adb2b2eb069b2df918f455c4e18cc646"
+checksum = "09edd9e8b54e49e587e4f6295a7d29c3ea94d469cb40ab8ca70b288248a81db2"
 
 [[package]]
 name = "libappindicator"
@@ -2257,9 +2145,18 @@ dependencies = [
 
 [[package]]
 name = "libc"
-version = "0.2.175"
+version = "0.2.186"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "68ab91017fe16c622486840e4c83c9a37afeff978bd239b5293d61ece587de66"
+
+[[package]]
+name = "libdbus-sys"
+version = "0.2.7"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "6a82ae493e598baaea5209805c49bbf2ea7de956d50d7da0da1164f9c6d28543"
+checksum = "328c4789d42200f1eeec05bd86c9c13c7f091d2ba9a6ea35acdf51f31bc0f043"
+dependencies = [
+ "pkg-config",
+]
 
 [[package]]
 name = "libloading"
@@ -2273,135 +2170,80 @@ dependencies = [
 
 [[package]]
 name = "libredox"
-version = "0.1.9"
+version = "0.1.16"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "391290121bad3d37fbddad76d8f5d1c1c314cfc646d143d7e07a3086ddff0ce3"
+checksum = "e02f3bb43d335493c96bf3fd3a321600bf6bd07ed34bc64118e9293bdffea46c"
 dependencies = [
- "bitflags 2.8.0",
  "libc",
 ]
 
-[[package]]
-name = "line-wrap"
-version = "0.1.1"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "f30344350a2a51da54c1d53be93fade8a237e545dbcc4bdbe635413f2117cab9"
-dependencies = [
- "safemem",
-]
-
-[[package]]
-name = "linux-raw-sys"
-version = "0.4.15"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "d26c52dbd32dccf2d10cac7725f8eae5296885fb5703b261f7d0a0739ec807ab"
-
 [[package]]
 name = "linux-raw-sys"
-version = "0.9.4"
+version = "0.12.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "cd945864f07fe9f5371a27ad7b52a172b4b499999f1d97574c9fa68373937e12"
+checksum = "32a66949e030da00e8c7d4434b251670a91556f4144941d37452769c25d58a53"
 
 [[package]]
 name = "litemap"
-version = "0.8.0"
+version = "0.8.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "241eaef5fd12c88705a01fc1066c48c4b36e0dd4377dcdc7ec3942cea7a69956"
+checksum = "92daf443525c4cce67b150400bc2316076100ce0b3686209eb8cf3c31612e6f0"
 
 [[package]]
 name = "litrs"
-version = "0.4.2"
+version = "1.0.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "f5e54036fe321fd421e10d732f155734c4e4afd610dd556d9a82833ab3ee0bed"
+checksum = "11d3d7f243d5c5a8b9bb5d6dd2b1602c0cb0b9db1621bafc7ed66e35ff9fe092"
 
 [[package]]
 name = "lock_api"
-version = "0.4.9"
+version = "0.4.14"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "435011366fe56583b16cf956f9df0095b405b82d76425bc8981c0e22e60ec4df"
+checksum = "224399e74b87b5f3557511d98dff8b14089b3dadafcab6bb93eab67d3aace965"
 dependencies = [
- "autocfg",
  "scopeguard",
 ]
 
 [[package]]
 name = "log"
-version = "0.4.27"
+version = "0.4.29"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "13dc2df351e3202783a1fe0d44375f7295ffb4049267b0f3018346dc122a1d94"
+checksum = "5e5032e24019045c762d3c0f28f5b6b8bbf38563a65908389bf7978758920897"
 
 [[package]]
-name = "mac"
-version = "0.1.1"
+name = "lru-slab"
+version = "0.1.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "c41e0c4fef86961ac6d6f8a82609f55f31b05e4fce149ac5710e439df7619ba4"
+checksum = "112b39cec0b298b6c1999fee3e31427f74f676e4cb9879ed1a121b43661a4154"
 
 [[package]]
 name = "mac-notification-sys"
-version = "0.6.6"
+version = "0.6.12"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "119c8490084af61b44c9eda9d626475847a186737c0378c85e32d77c33a01cd4"
+checksum = "29a16783dd1a47849b8c8133c9cd3eb2112cfbc6901670af3dba47c8bbfb07d3"
 dependencies = [
  "cc",
- "objc2 0.6.2",
- "objc2-foundation 0.3.1",
+ "objc2",
+ "objc2-foundation",
  "time",
 ]
 
-[[package]]
-name = "malloc_buf"
-version = "0.0.6"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "62bb907fe88d54d8d9ce32a3cceab4218ed2f6b7d35617cafe9adf84e43919cb"
-dependencies = [
- "libc",
-]
-
 [[package]]
 name = "markup5ever"
-version = "0.14.1"
+version = "0.38.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "c7a7213d12e1864c0f002f52c2923d4556935a43dec5e71355c2760e0f6e7a18"
+checksum = "8983d30f2915feeaaab2d6babdd6bc7e9ed1a00b66b5e6d74df19aa9c0e91862"
 dependencies = [
  "log",
- "phf 0.11.2",
- "phf_codegen 0.11.3",
- "string_cache",
- "string_cache_codegen",
  "tendril",
+ "web_atoms",
 ]
 
-[[package]]
-name = "match_token"
-version = "0.1.0"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "88a9689d8d44bf9964484516275f5cd4c9b59457a6940c1d5d0ecbb94510a36b"
-dependencies = [
- "proc-macro2",
- "quote",
- "syn 2.0.106",
-]
-
-[[package]]
-name = "matches"
-version = "0.1.9"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "a3e378b66a060d48947b590737b30a1be76706c8dd7b8ba0f2fe3989c68a853f"
-
 [[package]]
 name = "memchr"
-version = "2.7.5"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "32a282da65faaf38286cf3be983213fcf1d2e2a58700e808f83f4ea9a4804bc0"
-
-[[package]]
-name = "memoffset"
-version = "0.6.5"
+version = "2.8.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "5aa361d4faea93603064a027415f07bd8e1d5c88c9fbf68bf56a285428fd79ce"
-dependencies = [
- "autocfg",
-]
+checksum = "f8ca58f447f06ed17d5fc4043ce1b10dd205e060fb3ce5b979b8ed8e59ff3f79"
 
 [[package]]
 name = "memoffset"
@@ -2418,52 +2260,56 @@ version = "0.3.17"
 source = "registry+https://github.com/rust-lang/crates.io-index"
 checksum = "6877bb514081ee2a7ff5ef9de3281f14a4dd4bceac4c09388074a6b5df8a139a"
 
-[[package]]
-name = "minimal-lexical"
-version = "0.2.1"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "68354c5c6bd36d73ff3feceb05efa59b6acb7626617f4962be322a825e61f79a"
-
 [[package]]
 name = "miniz_oxide"
-version = "0.6.2"
+version = "0.8.9"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "b275950c28b37e794e8c55d88aeb5e139d0ce23fdbbeda68f8d7174abdf9e8fa"
+checksum = "1fa76a2c86f704bdb222d66965fb3d63269ce38518b83cb0575fca855ebb6316"
 dependencies = [
- "adler",
+ "adler2",
+ "simd-adler32",
 ]
 
 [[package]]
 name = "mio"
-version = "0.8.9"
+version = "1.2.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "3dce281c5e46beae905d4de1870d8b1509a9142b62eedf18b443b011ca8343d0"
+checksum = "50b7e5b27aa02a74bac8c3f23f448f8d87ff11f92d3aac1a6ed369ee08cc56c1"
 dependencies = [
  "libc",
- "log",
- "wasi 0.11.0+wasi-snapshot-preview1",
- "windows-sys 0.48.0",
+ "wasi",
+ "windows-sys 0.61.2",
+]
+
+[[package]]
+name = "moxcms"
+version = "0.8.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "bb85c154ba489f01b25c0d36ae69a87e4a1c73a72631fc6c0eb6dde34a73e44b"
+dependencies = [
+ "num-traits",
+ "pxfm",
 ]
 
 [[package]]
 name = "muda"
-version = "0.17.1"
+version = "0.19.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "01c1738382f66ed56b3b9c8119e794a2e23148ac8ea214eda86622d4cb9d415a"
+checksum = "0ae8844f63b5b118e334e205585b8c5c17b984121dbdb179d44aeb087ffad3cb"
 dependencies = [
  "crossbeam-channel",
  "dpi",
  "gtk",
  "keyboard-types",
- "objc2 0.6.2",
- "objc2-app-kit 0.3.1",
+ "objc2",
+ "objc2-app-kit",
  "objc2-core-foundation",
- "objc2-foundation 0.3.1",
+ "objc2-foundation",
  "once_cell",
- "png",
+ "png 0.18.1",
  "serde",
- "thiserror 2.0.15",
- "windows-sys 0.60.2",
+ "thiserror 2.0.18",
+ "windows-sys 0.61.2",
 ]
 
 [[package]]
@@ -2472,82 +2318,58 @@ version = "0.9.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
 checksum = "c3f42e7bbe13d351b6bead8286a43aac9534b82bd3cc43e47037f012ebfd62d4"
 dependencies = [
- "bitflags 2.8.0",
- "jni-sys",
+ "bitflags 2.11.1",
+ "jni-sys 0.3.1",
  "log",
  "ndk-sys",
  "num_enum",
  "raw-window-handle",
- "thiserror 1.0.50",
+ "thiserror 1.0.69",
 ]
 
-[[package]]
-name = "ndk-context"
-version = "0.1.1"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "27b02d87554356db9e9a873add8782d4ea6e3e58ea071a9adb9a2e8ddb884a8b"
-
 [[package]]
 name = "ndk-sys"
 version = "0.6.0+11769913"
 source = "registry+https://github.com/rust-lang/crates.io-index"
 checksum = "ee6cda3051665f1fb8d9e08fc35c96d5a244fb1be711a03b71118828afc9a873"
 dependencies = [
- "jni-sys",
+ "jni-sys 0.3.1",
 ]
 
 [[package]]
 name = "new_debug_unreachable"
-version = "1.0.4"
+version = "1.0.6"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "e4a24736216ec316047a1fc4252e27dabb04218aa4a3f37c6e7ddbf1f9782b54"
+checksum = "650eef8c711430f1a879fdd01d4745a7deea475becfb90269c06775983bbf086"
 
 [[package]]
 name = "nix"
-version = "0.24.3"
+version = "0.30.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "fa52e972a9a719cecb6864fb88568781eb706bac2cd1d4f04a648542dbf78069"
+checksum = "74523f3a35e05aba87a1d978330aef40f67b0304ac79c1c00b294c9830543db6"
 dependencies = [
- "bitflags 1.3.2",
+ "bitflags 2.11.1",
  "cfg-if",
+ "cfg_aliases",
  "libc",
- "memoffset 0.6.5",
 ]
 
 [[package]]
-name = "nix"
-version = "0.27.1"
+name = "nom"
+version = "8.0.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "2eb04e9c688eff1c89d72b407f168cf79bb9e867a9d3323ed6c01519eb9cc053"
-dependencies = [
- "bitflags 2.8.0",
- "cfg-if",
- "libc",
- "memoffset 0.9.1",
-]
-
-[[package]]
-name = "nodrop"
-version = "0.1.14"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "72ef4a56884ca558e5ddb05a1d1e7e1bfd9a68d9ed024c21704cc98872dae1bb"
-
-[[package]]
-name = "nom"
-version = "7.1.3"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "d273983c5a657a70a3e8f2a01329822f3b8c8172b73826411a55751e404a0a4a"
+checksum = "df9761775871bdef83bee530e60050f7e54b1105350d6884eb0fb4f46c2f9405"
 dependencies = [
  "memchr",
- "minimal-lexical",
 ]
 
 [[package]]
 name = "notify-rust"
-version = "4.11.3"
+version = "4.17.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "5134a72dc570b178bff81b01e81ab14a6fcc015391ed4b3b14853090658cd3a3"
+checksum = "50ff2e74231b72c832d82982193b417f230945be6bdb5575b251d941d31adb00"
 dependencies = [
+ "futures-lite",
  "log",
  "mac-notification-sys",
  "serde",
@@ -2556,50 +2378,25 @@ dependencies = [
 ]
 
 [[package]]
-name = "num-integer"
-version = "0.1.45"
+name = "num-conv"
+version = "0.2.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "225d3389fb3509a24c93f5c29eb6bde2586b98d9f016636dff58d7c6f7569cd9"
-dependencies = [
- "autocfg",
- "num-traits",
-]
-
-[[package]]
-name = "num-rational"
-version = "0.4.1"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "0638a1c9d0a3c0914158145bc76cff373a75a627e6ecbfb71cbe6f453a5a19b0"
-dependencies = [
- "autocfg",
- "num-integer",
- "num-traits",
-]
+checksum = "c6673768db2d862beb9b39a78fdcb1a69439615d5794a1be50caa9bc92c81967"
 
 [[package]]
 name = "num-traits"
-version = "0.2.15"
+version = "0.2.19"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "578ede34cf02f8924ab9447f50c28075b4d3e5b269972345e7e0372b38c6cdcd"
+checksum = "071dfc062690e90b734c0b2273ce72ad0ffa95f0c74596bc250dcfd960262841"
 dependencies = [
  "autocfg",
 ]
 
-[[package]]
-name = "num_cpus"
-version = "1.14.0"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "f6058e64324c71e02bc2b150e4f3bc8286db6c83092132ffa3f6b1eab0f9def5"
-dependencies = [
- "hermit-abi 0.1.19",
- "libc",
-]
-
 [[package]]
 name = "num_enum"
-version = "0.7.4"
+version = "0.7.6"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "a973b4e44ce6cad84ce69d797acf9a044532e4184c4f267913d1b546a0727b7a"
+checksum = "5d0bca838442ec211fa11de3a8b0e0e8f3a4522575b5c4c06ed722e005036f26"
 dependencies = [
  "num_enum_derive",
  "rustversion",
@@ -2607,57 +2404,21 @@ dependencies = [
 
 [[package]]
 name = "num_enum_derive"
-version = "0.7.4"
+version = "0.7.6"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "77e878c846a8abae00dd069496dbe8751b16ac1c3d6bd2a7283a938e8228f90d"
+checksum = "680998035259dcfcafe653688bf2aa6d3e2dc05e98be6ab46afb089dc84f1df8"
 dependencies = [
- "proc-macro-crate 2.0.2",
+ "proc-macro-crate 3.5.0",
  "proc-macro2",
  "quote",
- "syn 2.0.106",
-]
-
-[[package]]
-name = "objc"
-version = "0.2.7"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "915b1b472bc21c53464d6c8461c9d3af805ba1ef837e1cac254428f4a77177b1"
-dependencies = [
- "malloc_buf",
+ "syn 2.0.117",
 ]
 
-[[package]]
-name = "objc-foundation"
-version = "0.1.1"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "1add1b659e36c9607c7aab864a76c7a4c2760cd0cd2e120f3fb8b952c7e22bf9"
-dependencies = [
- "block",
- "objc",
- "objc_id",
-]
-
-[[package]]
-name = "objc-sys"
-version = "0.3.5"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "cdb91bdd390c7ce1a8607f35f3ca7151b65afc0ff5ff3b34fa350f7d7c7e4310"
-
 [[package]]
 name = "objc2"
-version = "0.5.2"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "46a785d4eeff09c14c487497c162e92766fbb3e4059a71840cecc03d9a50b804"
-dependencies = [
- "objc-sys",
- "objc2-encode",
-]
-
-[[package]]
-name = "objc2"
-version = "0.6.2"
+version = "0.6.4"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "561f357ba7f3a2a61563a186a163d0a3a5247e1089524a3981d49adb775078bc"
+checksum = "3a12a8ed07aefc768292f076dc3ac8c48f3781c8f2d5851dd3d98950e8c5a89f"
 dependencies = [
  "objc2-encode",
  "objc2-exception-helper",
@@ -2665,117 +2426,93 @@ dependencies = [
 
 [[package]]
 name = "objc2-app-kit"
-version = "0.2.2"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "e4e89ad9e3d7d297152b17d39ed92cd50ca8063a89a9fa569046d41568891eff"
-dependencies = [
- "bitflags 2.8.0",
- "block2 0.5.1",
- "libc",
- "objc2 0.5.2",
- "objc2-core-data 0.2.2",
- "objc2-core-image 0.2.2",
- "objc2-foundation 0.2.2",
- "objc2-quartz-core 0.2.2",
-]
-
-[[package]]
-name = "objc2-app-kit"
-version = "0.3.1"
+version = "0.3.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "e6f29f568bec459b0ddff777cec4fe3fd8666d82d5a40ebd0ff7e66134f89bcc"
+checksum = "d49e936b501e5c5bf01fda3a9452ff86dc3ea98ad5f283e1455153142d97518c"
 dependencies = [
- "bitflags 2.8.0",
- "block2 0.6.1",
- "libc",
- "objc2 0.6.2",
- "objc2-cloud-kit",
- "objc2-core-data 0.3.1",
+ "bitflags 2.11.1",
+ "block2",
+ "objc2",
  "objc2-core-foundation",
  "objc2-core-graphics",
- "objc2-core-image 0.3.1",
- "objc2-foundation 0.3.1",
- "objc2-quartz-core 0.3.1",
+ "objc2-foundation",
 ]
 
 [[package]]
 name = "objc2-cloud-kit"
-version = "0.3.1"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "17614fdcd9b411e6ff1117dfb1d0150f908ba83a7df81b1f118005fe0a8ea15d"
-dependencies = [
- "bitflags 2.8.0",
- "objc2 0.6.2",
- "objc2-foundation 0.3.1",
-]
-
-[[package]]
-name = "objc2-core-data"
-version = "0.2.2"
+version = "0.3.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "617fbf49e071c178c0b24c080767db52958f716d9eabdf0890523aeae54773ef"
+checksum = "73ad74d880bb43877038da939b7427bba67e9dd42004a18b809ba7d87cee241c"
 dependencies = [
- "bitflags 2.8.0",
- "block2 0.5.1",
- "objc2 0.5.2",
- "objc2-foundation 0.2.2",
+ "bitflags 2.11.1",
+ "objc2",
+ "objc2-foundation",
 ]
 
 [[package]]
 name = "objc2-core-data"
-version = "0.3.1"
+version = "0.3.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "291fbbf7d29287518e8686417cf7239c74700fd4b607623140a7d4a3c834329d"
+checksum = "0b402a653efbb5e82ce4df10683b6b28027616a2715e90009947d50b8dd298fa"
 dependencies = [
- "bitflags 2.8.0",
- "objc2 0.6.2",
- "objc2-foundation 0.3.1",
+ "objc2",
+ "objc2-foundation",
 ]
 
 [[package]]
 name = "objc2-core-foundation"
-version = "0.3.1"
+version = "0.3.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "1c10c2894a6fed806ade6027bcd50662746363a9589d3ec9d9bef30a4e4bc166"
+checksum = "2a180dd8642fa45cdb7dd721cd4c11b1cadd4929ce112ebd8b9f5803cc79d536"
 dependencies = [
- "bitflags 2.8.0",
+ "bitflags 2.11.1",
  "dispatch2",
- "objc2 0.6.2",
+ "objc2",
 ]
 
 [[package]]
 name = "objc2-core-graphics"
-version = "0.3.1"
+version = "0.3.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "989c6c68c13021b5c2d6b71456ebb0f9dc78d752e86a98da7c716f4f9470f5a4"
+checksum = "e022c9d066895efa1345f8e33e584b9f958da2fd4cd116792e15e07e4720a807"
 dependencies = [
- "bitflags 2.8.0",
+ "bitflags 2.11.1",
  "dispatch2",
- "objc2 0.6.2",
+ "objc2",
  "objc2-core-foundation",
  "objc2-io-surface",
 ]
 
 [[package]]
 name = "objc2-core-image"
-version = "0.2.2"
+version = "0.3.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "55260963a527c99f1819c4f8e3b47fe04f9650694ef348ffd2227e8196d34c80"
+checksum = "e5d563b38d2b97209f8e861173de434bd0214cf020e3423a52624cd1d989f006"
 dependencies = [
- "block2 0.5.1",
- "objc2 0.5.2",
- "objc2-foundation 0.2.2",
- "objc2-metal",
+ "objc2",
+ "objc2-foundation",
 ]
 
 [[package]]
-name = "objc2-core-image"
-version = "0.3.1"
+name = "objc2-core-location"
+version = "0.3.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "79b3dc0cc4386b6ccf21c157591b34a7f44c8e75b064f85502901ab2188c007e"
+checksum = "ca347214e24bc973fc025fd0d36ebb179ff30536ed1f80252706db19ee452009"
 dependencies = [
- "objc2 0.6.2",
- "objc2-foundation 0.3.1",
+ "objc2",
+ "objc2-foundation",
+]
+
+[[package]]
+name = "objc2-core-text"
+version = "0.3.2"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "0cde0dfb48d25d2b4862161a4d5fcc0e3c24367869ad306b0c9ec0073bfed92d"
+dependencies = [
+ "bitflags 2.11.1",
+ "objc2",
+ "objc2-core-foundation",
+ "objc2-core-graphics",
 ]
 
 [[package]]
@@ -2795,123 +2532,96 @@ dependencies = [
 
 [[package]]
 name = "objc2-foundation"
-version = "0.2.2"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "0ee638a5da3799329310ad4cfa62fbf045d5f56e3ef5ba4149e7452dcf89d5a8"
-dependencies = [
- "bitflags 2.8.0",
- "block2 0.5.1",
- "dispatch",
- "libc",
- "objc2 0.5.2",
-]
-
-[[package]]
-name = "objc2-foundation"
-version = "0.3.1"
+version = "0.3.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "900831247d2fe1a09a683278e5384cfb8c80c79fe6b166f9d14bfdde0ea1b03c"
+checksum = "e3e0adef53c21f888deb4fa59fc59f7eb17404926ee8a6f59f5df0fd7f9f3272"
 dependencies = [
- "bitflags 2.8.0",
- "block2 0.6.1",
+ "bitflags 2.11.1",
+ "block2",
  "libc",
- "objc2 0.6.2",
+ "objc2",
  "objc2-core-foundation",
 ]
 
 [[package]]
 name = "objc2-io-surface"
-version = "0.3.1"
+version = "0.3.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "7282e9ac92529fa3457ce90ebb15f4ecbc383e8338060960760fa2cf75420c3c"
+checksum = "180788110936d59bab6bd83b6060ffdfffb3b922ba1396b312ae795e1de9d81d"
 dependencies = [
- "bitflags 2.8.0",
- "objc2 0.6.2",
+ "bitflags 2.11.1",
+ "objc2",
  "objc2-core-foundation",
 ]
 
-[[package]]
-name = "objc2-metal"
-version = "0.2.2"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "dd0cba1276f6023976a406a14ffa85e1fdd19df6b0f737b063b95f6c8c7aadd6"
-dependencies = [
- "bitflags 2.8.0",
- "block2 0.5.1",
- "objc2 0.5.2",
- "objc2-foundation 0.2.2",
-]
-
-[[package]]
-name = "objc2-quartz-core"
-version = "0.2.2"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "e42bee7bff906b14b167da2bac5efe6b6a07e6f7c0a21a7308d40c960242dc7a"
-dependencies = [
- "bitflags 2.8.0",
- "block2 0.5.1",
- "objc2 0.5.2",
- "objc2-foundation 0.2.2",
- "objc2-metal",
-]
-
 [[package]]
 name = "objc2-quartz-core"
-version = "0.3.1"
+version = "0.3.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "90ffb6a0cd5f182dc964334388560b12a57f7b74b3e2dec5e2722aa2dfb2ccd5"
+checksum = "96c1358452b371bf9f104e21ec536d37a650eb10f7ee379fff67d2e08d537f1f"
 dependencies = [
- "bitflags 2.8.0",
- "objc2 0.6.2",
- "objc2-foundation 0.3.1",
+ "bitflags 2.11.1",
+ "objc2",
+ "objc2-core-foundation",
+ "objc2-foundation",
 ]
 
 [[package]]
 name = "objc2-ui-kit"
-version = "0.3.1"
+version = "0.3.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "25b1312ad7bc8a0e92adae17aa10f90aae1fb618832f9b993b022b591027daed"
+checksum = "d87d638e33c06f577498cbcc50491496a3ed4246998a7fbba7ccb98b1e7eab22"
 dependencies = [
- "bitflags 2.8.0",
- "objc2 0.6.2",
+ "bitflags 2.11.1",
+ "block2",
+ "objc2",
+ "objc2-cloud-kit",
+ "objc2-core-data",
  "objc2-core-foundation",
- "objc2-foundation 0.3.1",
+ "objc2-core-graphics",
+ "objc2-core-image",
+ "objc2-core-location",
+ "objc2-core-text",
+ "objc2-foundation",
+ "objc2-quartz-core",
+ "objc2-user-notifications",
 ]
 
 [[package]]
-name = "objc2-web-kit"
-version = "0.3.1"
+name = "objc2-user-notifications"
+version = "0.3.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "91672909de8b1ce1c2252e95bbee8c1649c9ad9d14b9248b3d7b4c47903c47ad"
+checksum = "9df9128cbbfef73cda168416ccf7f837b62737d748333bfe9ab71c245d76613e"
 dependencies = [
- "bitflags 2.8.0",
- "block2 0.6.1",
- "objc2 0.6.2",
- "objc2-app-kit 0.3.1",
- "objc2-core-foundation",
- "objc2-foundation 0.3.1",
+ "objc2",
+ "objc2-foundation",
 ]
 
 [[package]]
-name = "objc_id"
-version = "0.1.1"
+name = "objc2-web-kit"
+version = "0.3.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "c92d4ddb4bd7b50d730c215ff871754d0da6b2178849f8a2a2ab69712d0c073b"
+checksum = "b2e5aaab980c433cf470df9d7af96a7b46a9d892d521a2cbbb2f8a4c16751e7f"
 dependencies = [
- "objc",
+ "bitflags 2.11.1",
+ "block2",
+ "objc2",
+ "objc2-app-kit",
+ "objc2-core-foundation",
+ "objc2-foundation",
 ]
 
 [[package]]
 name = "once_cell"
-version = "1.21.3"
+version = "1.21.4"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "42f5e15c9953c5e4ccceeb2e7382a716482c34515315f7b03532b8b4e8393d2d"
+checksum = "9f7c3e4beb33f85d45ae3e3a1792185706c8e16d043238c593331cc7cd313b50"
 
 [[package]]
 name = "open"
-version = "5.3.2"
+version = "5.3.4"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "e2483562e62ea94312f3576a7aca397306df7990b8d89033e18766744377ef95"
+checksum = "9f3bab717c29a857abf75fcef718d441ec7cb2725f937343c734740a985d37fd"
 dependencies = [
  "dunce",
  "is-wsl",
@@ -2937,23 +2647,28 @@ dependencies = [
 
 [[package]]
 name = "os_info"
-version = "3.11.0"
+version = "3.14.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "41fc863e2ca13dc2d5c34fb22ea4a588248ac14db929616ba65c45f21744b1e9"
+checksum = "e4022a17595a00d6a369236fdae483f0de7f0a339960a53118b818238e132224"
 dependencies = [
+ "android_system_properties",
  "log",
+ "nix",
+ "objc2",
+ "objc2-foundation",
+ "objc2-ui-kit",
  "serde",
- "windows-sys 0.52.0",
+ "windows-sys 0.61.2",
 ]
 
 [[package]]
 name = "os_pipe"
-version = "1.2.2"
+version = "1.2.3"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "db335f4760b14ead6290116f2427bf33a14d4f0617d49f78a246de10c1831224"
+checksum = "7d8fae84b431384b68627d0f9b3b1245fcf9f46f6c0e3dc902e9dce64edd1967"
 dependencies = [
  "libc",
- "windows-sys 0.59.0",
+ "windows-sys 0.61.2",
 ]
 
 [[package]]
@@ -2989,9 +2704,9 @@ checksum = "f38d5652c16fde515bb1ecef450ab0f6a219d619a7274976324d5e377f7dceba"
 
 [[package]]
 name = "parking_lot"
-version = "0.12.1"
+version = "0.12.5"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "3742b2c103b9f06bc9fff0a37ff4912935851bee6d36f3c02bcc755bcfec228f"
+checksum = "93857453250e3077bd71ff98b6a65ea6621a19bb0f559a85248955ac12c45a1a"
 dependencies = [
  "lock_api",
  "parking_lot_core",
@@ -2999,15 +2714,15 @@ dependencies = [
 
 [[package]]
 name = "parking_lot_core"
-version = "0.9.5"
+version = "0.9.12"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "7ff9f3fef3968a3ec5945535ed654cb38ff72d7495a25619e2247fb15a2ed9ba"
+checksum = "2621685985a2ebf1c516881c026032ac7deafcda1a2c9b7850dc81e3dfcb64c1"
 dependencies = [
  "cfg-if",
  "libc",
- "redox_syscall 0.2.16",
+ "redox_syscall",
  "smallvec",
- "windows-sys 0.42.0",
+ "windows-link 0.2.1",
 ]
 
 [[package]]
@@ -3018,267 +2733,173 @@ checksum = "df94ce210e5bc13cb6651479fa48d14f601d9858cfe0467f43ae157023b938d3"
 
 [[package]]
 name = "percent-encoding"
-version = "2.3.1"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "e3148f5046208a5d56bcfc03053e3ca6334e51da8dfb19b6cdc8b306fae3283e"
-
-[[package]]
-name = "pest"
-version = "2.5.1"
+version = "2.3.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "cc8bed3549e0f9b0a2a78bf7c0018237a2cdf085eecbbc048e52612438e4e9d0"
-dependencies = [
- "thiserror 1.0.50",
- "ucd-trie",
-]
+checksum = "9b4f627cb1b25917193a259e49bdad08f671f8d9708acfd5fe0a8c1455d87220"
 
 [[package]]
 name = "petgraph"
-version = "0.6.5"
+version = "0.8.3"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "b4c5cc86750666a3ed20bdaf5ca2a0344f9c67674cae0515bec2da16fbaa47db"
+checksum = "8701b58ea97060d5e5b155d383a69952a60943f0e6dfe30b04c287beb0b27455"
 dependencies = [
  "fixedbitset",
- "indexmap 2.10.0",
-]
-
-[[package]]
-name = "phf"
-version = "0.8.0"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "3dfb61232e34fcb633f43d12c58f83c1df82962dcdfa565a4e866ffc17dafe12"
-dependencies = [
- "phf_shared 0.8.0",
-]
-
-[[package]]
-name = "phf"
-version = "0.10.1"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "fabbf1ead8a5bcbc20f5f8b939ee3f5b0f6f281b6ad3468b84656b658b455259"
-dependencies = [
- "phf_macros 0.10.0",
- "phf_shared 0.10.0",
- "proc-macro-hack",
+ "hashbrown 0.15.5",
+ "indexmap 2.14.0",
 ]
 
 [[package]]
 name = "phf"
-version = "0.11.2"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "ade2d8b8f33c7333b51bcf0428d37e217e9f32192ae4772156f65063b8ce03dc"
-dependencies = [
- "phf_macros 0.11.2",
- "phf_shared 0.11.2",
-]
-
-[[package]]
-name = "phf_codegen"
-version = "0.8.0"
+version = "0.13.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "cbffee61585b0411840d3ece935cce9cb6321f01c45477d30066498cd5e1a815"
+checksum = "c1562dc717473dbaa4c1f85a36410e03c047b2e7df7f45ee938fbef64ae7fadf"
 dependencies = [
- "phf_generator 0.8.0",
- "phf_shared 0.8.0",
+ "phf_macros",
+ "phf_shared",
+ "serde",
 ]
 
 [[package]]
 name = "phf_codegen"
-version = "0.11.3"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "aef8048c789fa5e851558d709946d6d79a8ff88c0440c587967f8e94bfb1216a"
-dependencies = [
- "phf_generator 0.11.2",
- "phf_shared 0.11.2",
-]
-
-[[package]]
-name = "phf_generator"
-version = "0.8.0"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "17367f0cc86f2d25802b2c26ee58a7b23faeccf78a396094c13dced0d0182526"
-dependencies = [
- "phf_shared 0.8.0",
- "rand 0.7.3",
-]
-
-[[package]]
-name = "phf_generator"
-version = "0.10.0"
+version = "0.13.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "5d5285893bb5eb82e6aaf5d59ee909a06a16737a8970984dd7746ba9283498d6"
+checksum = "49aa7f9d80421bca176ca8dbfebe668cc7a2684708594ec9f3c0db0805d5d6e1"
 dependencies = [
- "phf_shared 0.10.0",
- "rand 0.8.5",
+ "phf_generator",
+ "phf_shared",
 ]
 
 [[package]]
 name = "phf_generator"
-version = "0.11.2"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "48e4cc64c2ad9ebe670cb8fd69dd50ae301650392e81c05f9bfcb2d5bdbc24b0"
-dependencies = [
- "phf_shared 0.11.2",
- "rand 0.8.5",
-]
-
-[[package]]
-name = "phf_macros"
-version = "0.10.0"
+version = "0.13.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "58fdf3184dd560f160dd73922bea2d5cd6e8f064bf4b13110abd81b03697b4e0"
+checksum = "135ace3a761e564ec88c03a77317a7c6b80bb7f7135ef2544dbe054243b89737"
 dependencies = [
- "phf_generator 0.10.0",
- "phf_shared 0.10.0",
- "proc-macro-hack",
- "proc-macro2",
- "quote",
- "syn 1.0.105",
+ "fastrand",
+ "phf_shared",
 ]
 
 [[package]]
 name = "phf_macros"
-version = "0.11.2"
+version = "0.13.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "3444646e286606587e49f3bcf1679b8cef1dc2c5ecc29ddacaffc305180d464b"
+checksum = "812f032b54b1e759ccd5f8b6677695d5268c588701effba24601f6932f8269ef"
 dependencies = [
- "phf_generator 0.11.2",
- "phf_shared 0.11.2",
+ "phf_generator",
+ "phf_shared",
  "proc-macro2",
  "quote",
- "syn 2.0.106",
-]
-
-[[package]]
-name = "phf_shared"
-version = "0.8.0"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "c00cf8b9eafe68dde5e9eaa2cef8ee84a9336a47d566ec55ca16589633b65af7"
-dependencies = [
- "siphasher",
+ "syn 2.0.117",
 ]
 
 [[package]]
 name = "phf_shared"
-version = "0.10.0"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "b6796ad771acdc0123d2a88dc428b5e38ef24456743ddb1744ed628f9815c096"
-dependencies = [
- "siphasher",
-]
-
-[[package]]
-name = "phf_shared"
-version = "0.11.2"
+version = "0.13.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "90fcb95eef784c2ac79119d1dd819e162b5da872ce6f3c3abe1e8ca1c082f72b"
+checksum = "e57fef6bc5981e38c2ce2d63bfa546861309f875b8a75f092d1d54ae2d64f266"
 dependencies = [
  "siphasher",
 ]
 
-[[package]]
-name = "pin-project"
-version = "1.1.10"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "677f1add503faace112b9f1373e43e9e054bfdd22ff1a63c1bc485eaec6a6a8a"
-dependencies = [
- "pin-project-internal",
-]
-
-[[package]]
-name = "pin-project-internal"
-version = "1.1.10"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "6e918e4ff8c4549eb882f14b3a4bc8c8bc93de829416eacf579f1207a8fbf861"
-dependencies = [
- "proc-macro2",
- "quote",
- "syn 2.0.106",
-]
-
 [[package]]
 name = "pin-project-lite"
-version = "0.2.16"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "3b3cff922bd51709b605d9ead9aa71031d81447142d828eb4a6eba76fe619f9b"
-
-[[package]]
-name = "pin-utils"
-version = "0.1.0"
+version = "0.2.17"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "8b870d8c151b6f2fb93e84a13146138f05d02ed11c7e7c54f8826aaaf7c9f184"
+checksum = "a89322df9ebe1c1578d689c92318e070967d1042b512afbe49518723f4e6d5cd"
 
 [[package]]
 name = "piper"
-version = "0.2.4"
+version = "0.2.5"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "96c8c490f422ef9a4efd2cb5b42b76c8613d7e7dfc1caf667b8a3350a5acc066"
+checksum = "c835479a4443ded371d6c535cbfd8d31ad92c5d23ae9770a61bc155e4992a3c1"
 dependencies = [
  "atomic-waker",
- "fastrand 2.3.0",
+ "fastrand",
  "futures-io",
 ]
 
 [[package]]
 name = "pkg-config"
-version = "0.3.26"
+version = "0.3.33"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "6ac9a59f73473f1b8d852421e59e64809f025994837ef743615c6d0c5b305160"
+checksum = "19f132c84eca552bf34cab8ec81f1c1dcc229b811638f9d283dceabe58c5569e"
 
 [[package]]
 name = "plist"
-version = "1.3.1"
+version = "1.9.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "bd39bc6cdc9355ad1dc5eeedefee696bb35c34caf21768741e81826c0bbd7225"
+checksum = "092791278e026273c1b65bbdcfbba3a300f2994c896bd01ab01da613c29c46f1"
 dependencies = [
- "base64 0.13.1",
- "indexmap 1.9.2",
- "line-wrap",
+ "base64 0.22.1",
+ "indexmap 2.14.0",
+ "quick-xml 0.39.4",
  "serde",
  "time",
- "xml-rs",
 ]
 
 [[package]]
 name = "png"
-version = "0.17.7"
+version = "0.17.16"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "5d708eaf860a19b19ce538740d2b4bdeeb8337fa53f7738455e706623ad5c638"
+checksum = "82151a2fc869e011c153adc57cf2789ccb8d9906ce52c0b39a6b5697749d7526"
 dependencies = [
  "bitflags 1.3.2",
  "crc32fast",
+ "fdeflate",
+ "flate2",
+ "miniz_oxide",
+]
+
+[[package]]
+name = "png"
+version = "0.18.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "60769b8b31b2a9f263dae2776c37b1b28ae246943cf719eb6946a1db05128a61"
+dependencies = [
+ "bitflags 2.11.1",
+ "crc32fast",
+ "fdeflate",
  "flate2",
  "miniz_oxide",
 ]
 
 [[package]]
 name = "polling"
-version = "3.10.0"
+version = "3.11.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "b5bd19146350fe804f7cb2669c851c03d69da628803dab0d98018142aaa5d829"
+checksum = "5d0e4f59085d47d8241c88ead0f274e8a0cb551f3625263c05eb8dd897c34218"
 dependencies = [
  "cfg-if",
  "concurrent-queue",
- "hermit-abi 0.5.2",
+ "hermit-abi",
  "pin-project-lite",
- "rustix 1.0.8",
- "windows-sys 0.60.2",
+ "rustix",
+ "windows-sys 0.61.2",
 ]
 
 [[package]]
 name = "potential_utf"
-version = "0.1.2"
+version = "0.1.5"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "e5a7c30837279ca13e7c867e9e40053bc68740f988cb07f7ca6df43cc734b585"
+checksum = "0103b1cef7ec0cf76490e969665504990193874ea05c85ff9bab8b911d0a0564"
 dependencies = [
  "zerovec",
 ]
 
+[[package]]
+name = "powerfmt"
+version = "0.2.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "439ee305def115ba05938db6eb1644ff94165c5ab5e9420d1c1bcedbba909391"
+
 [[package]]
 name = "ppv-lite86"
-version = "0.2.17"
+version = "0.2.21"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "5b40af805b3121feab8a3c29f04d8ad262fa8e0561883e7653e024ae4479e6de"
+checksum = "85eae3c4ed2f50dcfe72643da4befc30deadb458a9b590d720cde2f2b1e97da9"
+dependencies = [
+ "zerocopy",
+]
 
 [[package]]
 name = "precomputed-hash"
@@ -3286,15 +2907,24 @@ version = "0.1.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
 checksum = "925383efa346730478fb4838dbe9137d2a47675ad789c546d150a6e1dd4ab31c"
 
+[[package]]
+name = "prettyplease"
+version = "0.2.37"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "479ca8adacdd7ce8f1fb39ce9ecccbfe93a3f1344b3d0d97f20bc0196208f62b"
+dependencies = [
+ "proc-macro2",
+ "syn 2.0.117",
+]
+
 [[package]]
 name = "proc-macro-crate"
-version = "1.2.1"
+version = "1.3.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "eda0fc3b0fb7c975631757e14d9049da17374063edb6ebbcbc54d880d4fe94e9"
+checksum = "7f4c021e1093a56626774e81216a4ce732a735e5bad4868a03f3ed65ca0c3919"
 dependencies = [
  "once_cell",
- "thiserror 1.0.50",
- "toml 0.5.9",
+ "toml_edit 0.19.15",
 ]
 
 [[package]]
@@ -3304,7 +2934,16 @@ source = "registry+https://github.com/rust-lang/crates.io-index"
 checksum = "b00f26d3400549137f92511a46ac1cd8ce37cb5598a96d382381458b992a5d24"
 dependencies = [
  "toml_datetime 0.6.3",
- "toml_edit",
+ "toml_edit 0.20.2",
+]
+
+[[package]]
+name = "proc-macro-crate"
+version = "3.5.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "e67ba7e9b2b56446f1d419b1d807906278ffa1a658a8a5d8a39dcb1f5a78614f"
+dependencies = [
+ "toml_edit 0.25.11+spec-1.1.0",
 ]
 
 [[package]]
@@ -3316,7 +2955,7 @@ dependencies = [
  "proc-macro-error-attr",
  "proc-macro2",
  "quote",
- "syn 1.0.105",
+ "syn 1.0.109",
  "version_check",
 ]
 
@@ -3331,17 +2970,11 @@ dependencies = [
  "version_check",
 ]
 
-[[package]]
-name = "proc-macro-hack"
-version = "0.5.19"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "dbf0c48bc1d91375ae5c3cd81e3722dff1abcf81a30960240640d223f59fe0e5"
-
 [[package]]
 name = "proc-macro2"
-version = "1.0.101"
+version = "1.0.106"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "89ae43fd86e4158d6db51ad8e2b80f313af9cc74f5c0e03ccb87de09998732de"
+checksum = "8fd00f0bb2e90d81d1044c2b32617f68fcb9fa3bb7640c23e9c748e53fb30934"
 dependencies = [
  "unicode-ident",
 ]
@@ -3358,18 +2991,21 @@ version = "2.3.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
 checksum = "6f42ea446cab60335f76979ec15e12619a2165b5ae2c12166bef27d283a9fadf"
 dependencies = [
- "idna 1.0.3",
+ "idna",
  "psl-types",
 ]
 
 [[package]]
-name = "quick-xml"
-version = "0.31.0"
+name = "pxfm"
+version = "0.1.29"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "1004a344b30a54e2ee58d66a71b32d2db2feb0a31f9a2d302bf0536f15de2a33"
-dependencies = [
- "memchr",
-]
+checksum = "e0c5ccf5294c6ccd63a74f1565028353830a9c2f5eb0c682c355c471726a6e3f"
+
+[[package]]
+name = "quick-error"
+version = "2.0.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "a993555f31e5a609f617c12db6250dedcac1b0a85076912c436e6fc9b2c8e6a3"
 
 [[package]]
 name = "quick-xml"
@@ -3381,99 +3017,117 @@ dependencies = [
 ]
 
 [[package]]
-name = "quote"
-version = "1.0.40"
+name = "quick-xml"
+version = "0.39.4"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "1885c039570dc00dcb4ff087a89e185fd56bae234ddc7f056a945bf36467248d"
+checksum = "cdcc8dd4e2f670d309a5f0e83fe36dfdc05af317008fea29144da1a2ac858e5e"
 dependencies = [
- "proc-macro2",
+ "memchr",
 ]
 
 [[package]]
-name = "r-efi"
-version = "5.3.0"
+name = "quinn"
+version = "0.11.9"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "69cdb34c158ceb288df11e18b4bd39de994f6657d83847bdffdbd7f346754b0f"
+checksum = "b9e20a958963c291dc322d98411f541009df2ced7b5a4f2bd52337638cfccf20"
+dependencies = [
+ "bytes",
+ "cfg_aliases",
+ "pin-project-lite",
+ "quinn-proto",
+ "quinn-udp",
+ "rustc-hash",
+ "rustls",
+ "socket2",
+ "thiserror 2.0.18",
+ "tokio",
+ "tracing",
+ "web-time",
+]
 
 [[package]]
-name = "rand"
-version = "0.7.3"
+name = "quinn-proto"
+version = "0.11.14"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "6a6b1679d49b24bbfe0c803429aa1874472f50d9b363131f0e89fc356b544d03"
+checksum = "434b42fec591c96ef50e21e886936e66d3cc3f737104fdb9b737c40ffb94c098"
 dependencies = [
- "getrandom 0.1.16",
- "libc",
- "rand_chacha 0.2.2",
- "rand_core 0.5.1",
- "rand_hc",
- "rand_pcg",
+ "bytes",
+ "getrandom 0.3.4",
+ "lru-slab",
+ "rand",
+ "ring",
+ "rustc-hash",
+ "rustls",
+ "rustls-pki-types",
+ "slab",
+ "thiserror 2.0.18",
+ "tinyvec",
+ "tracing",
+ "web-time",
 ]
 
 [[package]]
-name = "rand"
-version = "0.8.5"
+name = "quinn-udp"
+version = "0.5.14"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "34af8d1a0e25924bc5b7c43c079c942339d8f0a8b57c39049bef581b46327404"
+checksum = "addec6a0dcad8a8d96a771f815f0eaf55f9d1805756410b39f5fa81332574cbd"
 dependencies = [
+ "cfg_aliases",
  "libc",
- "rand_chacha 0.3.1",
- "rand_core 0.6.4",
+ "once_cell",
+ "socket2",
+ "tracing",
+ "windows-sys 0.60.2",
 ]
 
 [[package]]
-name = "rand_chacha"
-version = "0.2.2"
+name = "quote"
+version = "1.0.45"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "f4c8ed856279c9737206bf725bf36935d8666ead7aa69b52be55af369d193402"
+checksum = "41f2619966050689382d2b44f664f4bc593e129785a36d6ee376ddf37259b924"
 dependencies = [
- "ppv-lite86",
- "rand_core 0.5.1",
+ "proc-macro2",
 ]
 
 [[package]]
-name = "rand_chacha"
-version = "0.3.1"
+name = "r-efi"
+version = "5.3.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "e6c10a63a0fa32252be49d21e7709d4d4baf8d231c2dbce1eaa8141b9b127d88"
-dependencies = [
- "ppv-lite86",
- "rand_core 0.6.4",
-]
+checksum = "69cdb34c158ceb288df11e18b4bd39de994f6657d83847bdffdbd7f346754b0f"
 
 [[package]]
-name = "rand_core"
-version = "0.5.1"
+name = "r-efi"
+version = "6.0.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "90bde5296fc891b0cef12a6d03ddccc162ce7b2aff54160af9338f8d40df6d19"
-dependencies = [
- "getrandom 0.1.16",
-]
+checksum = "f8dcc9c7d52a811697d2151c701e0d08956f92b0e24136cf4cf27b57a6a0d9bf"
 
 [[package]]
-name = "rand_core"
-version = "0.6.4"
+name = "rand"
+version = "0.9.4"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "ec0be4795e2f6a28069bec0b5ff3e2ac9bafc99e6a9a7dc3547996c5c816922c"
+checksum = "44c5af06bb1b7d3216d91932aed5265164bf384dc89cd6ba05cf59a35f5f76ea"
 dependencies = [
- "getrandom 0.2.8",
+ "rand_chacha",
+ "rand_core",
 ]
 
 [[package]]
-name = "rand_hc"
-version = "0.2.0"
+name = "rand_chacha"
+version = "0.9.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "ca3129af7b92a17112d59ad498c6f81eaf463253766b90396d39ea7a39d6613c"
+checksum = "d3022b5f1df60f26e1ffddd6c66e8aa15de382ae63b3a0c1bfc0e4d3e3f325cb"
 dependencies = [
- "rand_core 0.5.1",
+ "ppv-lite86",
+ "rand_core",
 ]
 
 [[package]]
-name = "rand_pcg"
-version = "0.2.1"
+name = "rand_core"
+version = "0.9.5"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "16abd0c1b639e9eb4d7c50c0b8100b0d0f849be2349829c740fe8e6eb4816429"
+checksum = "76afc826de14238e6e8c374ddcc1fa19e374fd8dd986b0d2af0d02377261d83c"
 dependencies = [
- "rand_core 0.5.1",
+ "getrandom 0.3.4",
 ]
 
 [[package]]
@@ -3484,38 +3138,49 @@ checksum = "20675572f6f24e9e76ef639bc5552774ed45f1c30e2951e1e99c59888861c539"
 
 [[package]]
 name = "redox_syscall"
-version = "0.2.16"
+version = "0.5.18"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "fb5a58c1855b4b6819d59012155603f0b22ad30cad752600aadfcb695265519a"
+checksum = "ed2bf2547551a7053d6fdfafda3f938979645c44812fbfcda098faae3f1a362d"
 dependencies = [
- "bitflags 1.3.2",
+ "bitflags 2.11.1",
 ]
 
 [[package]]
-name = "redox_syscall"
-version = "0.5.17"
+name = "redox_users"
+version = "0.5.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "5407465600fb0548f1442edf71dd20683c6ed326200ace4b1ef0763521bb3b77"
+checksum = "a4e608c6638b9c18977b00b475ac1f28d14e84b27d8d42f70e0bf1e3dec127ac"
 dependencies = [
- "bitflags 2.8.0",
+ "getrandom 0.2.17",
+ "libredox",
+ "thiserror 2.0.18",
 ]
 
 [[package]]
-name = "redox_users"
-version = "0.5.2"
+name = "ref-cast"
+version = "1.0.25"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "a4e608c6638b9c18977b00b475ac1f28d14e84b27d8d42f70e0bf1e3dec127ac"
+checksum = "f354300ae66f76f1c85c5f84693f0ce81d747e2c3f21a45fef496d89c960bf7d"
 dependencies = [
- "getrandom 0.2.8",
- "libredox",
- "thiserror 2.0.15",
+ "ref-cast-impl",
+]
+
+[[package]]
+name = "ref-cast-impl"
+version = "1.0.25"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "b7186006dcb21920990093f30e3dea63b7d6e977bf1256be20c3563a5db070da"
+dependencies = [
+ "proc-macro2",
+ "quote",
+ "syn 2.0.117",
 ]
 
 [[package]]
 name = "regex"
-version = "1.11.1"
+version = "1.12.3"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "b544ef1b4eac5dc2db33ea63606ae9ffcfac26c1416a2806ae0bf5f56b201191"
+checksum = "e10754a14b9137dd7b1e3e5b0493cc9171fdd105e0ab477f51b72e7f3ac0e276"
 dependencies = [
  "aho-corasick",
  "memchr",
@@ -3525,9 +3190,9 @@ dependencies = [
 
 [[package]]
 name = "regex-automata"
-version = "0.4.9"
+version = "0.4.14"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "809e8dc61f6de73b46c85f4c96486310fe304c434cfa43669d7b40f711150908"
+checksum = "6e1dd4122fc1595e8162618945476892eefca7b88c52820e74af6262213cae8f"
 dependencies = [
  "aho-corasick",
  "memchr",
@@ -3536,32 +3201,22 @@ dependencies = [
 
 [[package]]
 name = "regex-syntax"
-version = "0.8.5"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "2b15c43186be67a4fd63bee50d0303afffcef381492ebe2c5d87f324e1b8815c"
-
-[[package]]
-name = "remove_dir_all"
-version = "0.5.3"
+version = "0.8.10"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "3acd125665422973a33ac9d3dd2df85edad0f4ae9b00dafb1a05e43a9f5ef8e7"
-dependencies = [
- "winapi",
-]
+checksum = "dc897dd8d9e8bd1ed8cdad82b5966c3e0ecae09fb1907d58efaa013543185d0a"
 
 [[package]]
 name = "reqwest"
-version = "0.12.4"
+version = "0.12.28"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "566cafdd92868e0939d3fb961bd0dc25fcfaaed179291093b3d43e6b3150ea10"
+checksum = "eddd3ca559203180a307f12d114c268abf583f59b03cb906fd0b3ff8646c1147"
 dependencies = [
  "base64 0.22.1",
  "bytes",
- "cookie 0.17.0",
- "cookie_store 0.20.0",
+ "cookie",
+ "cookie_store",
  "encoding_rs",
  "futures-core",
- "futures-util",
  "h2",
  "http",
  "http-body",
@@ -3569,122 +3224,137 @@ dependencies = [
  "hyper",
  "hyper-rustls",
  "hyper-util",
- "ipnet",
  "js-sys",
  "log",
  "mime",
- "once_cell",
  "percent-encoding",
  "pin-project-lite",
+ "quinn",
  "rustls",
- "rustls-pemfile",
  "rustls-pki-types",
  "serde",
  "serde_json",
  "serde_urlencoded",
  "sync_wrapper",
- "system-configuration",
  "tokio",
  "tokio-rustls",
+ "tower",
+ "tower-http",
+ "tower-service",
+ "url",
+ "wasm-bindgen",
+ "wasm-bindgen-futures",
+ "web-sys",
+ "webpki-roots",
+]
+
+[[package]]
+name = "reqwest"
+version = "0.13.3"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "62e0021ea2c22aed41653bc7e1419abb2c97e038ff2c33d0e1309e49a97deec0"
+dependencies = [
+ "base64 0.22.1",
+ "bytes",
+ "futures-core",
+ "futures-util",
+ "http",
+ "http-body",
+ "http-body-util",
+ "hyper",
+ "hyper-util",
+ "js-sys",
+ "log",
+ "percent-encoding",
+ "pin-project-lite",
+ "serde",
+ "serde_json",
+ "sync_wrapper",
+ "tokio",
  "tokio-util",
+ "tower",
+ "tower-http",
  "tower-service",
  "url",
  "wasm-bindgen",
  "wasm-bindgen-futures",
  "wasm-streams",
  "web-sys",
- "webpki-roots 0.26.11",
- "winreg 0.52.0",
 ]
 
 [[package]]
 name = "rfd"
-version = "0.15.0"
+version = "0.16.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "8af382a047821a08aa6bfc09ab0d80ff48d45d8726f7cd8e44891f7cb4a4278e"
+checksum = "a15ad77d9e70a92437d8f74c35d99b4e4691128df018833e99f90bcd36152672"
 dependencies = [
- "ashpd",
- "block2 0.5.1",
+ "block2",
+ "dispatch2",
  "glib-sys",
  "gobject-sys",
  "gtk-sys",
  "js-sys",
  "log",
- "objc2 0.5.2",
- "objc2-app-kit 0.2.2",
- "objc2-foundation 0.2.2",
+ "objc2",
+ "objc2-app-kit",
+ "objc2-core-foundation",
+ "objc2-foundation",
  "raw-window-handle",
  "wasm-bindgen",
  "wasm-bindgen-futures",
  "web-sys",
- "windows-sys 0.48.0",
+ "windows-sys 0.60.2",
 ]
 
 [[package]]
 name = "ring"
-version = "0.17.3"
+version = "0.17.14"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "9babe80d5c16becf6594aa32ad2be8fe08498e7ae60b77de8df700e67f191d7e"
+checksum = "a4689e6c2294d81e88dc6261c768b63bc4fcdb852be6d1352498b114f61383b7"
 dependencies = [
  "cc",
- "getrandom 0.2.8",
+ "cfg-if",
+ "getrandom 0.2.17",
  "libc",
- "spin",
  "untrusted",
- "windows-sys 0.48.0",
+ "windows-sys 0.52.0",
 ]
 
 [[package]]
-name = "rustc_version"
-version = "0.3.3"
+name = "rustc-hash"
+version = "2.1.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "f0dfe2087c51c460008730de8b57e6a320782fbfb312e1f4d520e6c6fae155ee"
-dependencies = [
- "semver 0.11.0",
-]
+checksum = "94300abf3f1ae2e2b8ffb7b58043de3d399c73fa6f4b73826402a5c457614dbe"
 
 [[package]]
 name = "rustc_version"
-version = "0.4.0"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "bfa0f585226d2e68097d4f95d113b15b83a82e819ab25717ec0590d9584ef366"
-dependencies = [
- "semver 1.0.14",
-]
-
-[[package]]
-name = "rustix"
-version = "0.38.44"
+version = "0.4.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "fdb5bc1ae2baa591800df16c9ca78619bf65c0488b41b96ccec5d11220d8c154"
+checksum = "cfcb3a22ef46e85b45de6ee7e79d063319ebb6594faafcf1c225ea92ab6e9b92"
 dependencies = [
- "bitflags 2.8.0",
- "errno",
- "libc",
- "linux-raw-sys 0.4.15",
- "windows-sys 0.59.0",
+ "semver",
 ]
 
 [[package]]
 name = "rustix"
-version = "1.0.8"
+version = "1.1.4"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "11181fbabf243db407ef8df94a6ce0b2f9a733bd8be4ad02b4eda9602296cac8"
+checksum = "b6fe4565b9518b83ef4f91bb47ce29620ca828bd32cb7e408f0062e9930ba190"
 dependencies = [
- "bitflags 2.8.0",
+ "bitflags 2.11.1",
  "errno",
  "libc",
- "linux-raw-sys 0.9.4",
- "windows-sys 0.60.2",
+ "linux-raw-sys",
+ "windows-sys 0.61.2",
 ]
 
 [[package]]
 name = "rustls"
-version = "0.22.4"
+version = "0.23.40"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "bf4ef73721ac7bcd79b2b315da7779d8fc09718c6b3d2d1b2d94850eb8c18432"
+checksum = "ef86cd5876211988985292b91c96a8f2d298df24e75989a43a3c73f2d4d8168b"
 dependencies = [
- "log",
+ "once_cell",
  "ring",
  "rustls-pki-types",
  "rustls-webpki",
@@ -3692,29 +3362,21 @@ dependencies = [
  "zeroize",
 ]
 
-[[package]]
-name = "rustls-pemfile"
-version = "2.2.0"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "dce314e5fee3f39953d46bb63bb8a46d40c2f8fb7cc5a3b6cab2bde9721d6e50"
-dependencies = [
- "rustls-pki-types",
-]
-
 [[package]]
 name = "rustls-pki-types"
-version = "1.12.0"
+version = "1.14.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "229a4a4c221013e7e1f1a043678c5cc39fe5171437c88fb47151a21e6f5b5c79"
+checksum = "30a7197ae7eb376e574fe940d068c30fe0462554a3ddbe4eca7838e049c937a9"
 dependencies = [
+ "web-time",
  "zeroize",
 ]
 
 [[package]]
 name = "rustls-webpki"
-version = "0.102.8"
+version = "0.103.13"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "64ca1bc8749bd4cf37b5ce386cc146580777b4e8572c7b97baf22c83f444bee9"
+checksum = "61c429a8649f110dddef65e2a5ad240f747e85f7758a6bccc7e5777bd33f756e"
 dependencies = [
  "ring",
  "rustls-pki-types",
@@ -3723,21 +3385,15 @@ dependencies = [
 
 [[package]]
 name = "rustversion"
-version = "1.0.9"
+version = "1.0.22"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "97477e48b4cf8603ad5f7aaf897467cf42ab4218a38ef76fb14c2d6773a6d6a8"
+checksum = "b39cdef0fa800fc44525c84ccb54a029961a8215f9619753635a9c0d2538d46d"
 
 [[package]]
 name = "ryu"
-version = "1.0.11"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "4501abdff3ae82a1c1b477a17252eb69cee9e66eb915c1abaa4f44d873df9f09"
-
-[[package]]
-name = "safemem"
-version = "0.3.3"
+version = "1.0.23"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "ef703b7cb59335eae2eb93ceb664c0eb7ea6bf567079d843e09420219668e072"
+checksum = "9774ba4a74de5f7b1c1451ed6cd5285a32eddb5cccb8cc655a4e50009e06477f"
 
 [[package]]
 name = "same-file"
@@ -3755,7 +3411,7 @@ source = "registry+https://github.com/rust-lang/crates.io-index"
 checksum = "3fbf2ae1b8bc8e02df939598064d22402220cd5bbcca1c76f7d6a310974d5615"
 dependencies = [
  "dyn-clone",
- "indexmap 1.9.2",
+ "indexmap 1.9.3",
  "schemars_derive",
  "serde",
  "serde_json",
@@ -3763,6 +3419,30 @@ dependencies = [
  "uuid",
 ]
 
+[[package]]
+name = "schemars"
+version = "0.9.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "4cd191f9397d57d581cddd31014772520aa448f65ef991055d7f61582c65165f"
+dependencies = [
+ "dyn-clone",
+ "ref-cast",
+ "serde",
+ "serde_json",
+]
+
+[[package]]
+name = "schemars"
+version = "1.2.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "a2b42f36aa1cd011945615b92222f6bf73c599a102a300334cd7f8dbeec726cc"
+dependencies = [
+ "dyn-clone",
+ "ref-cast",
+ "serde",
+ "serde_json",
+]
+
 [[package]]
 name = "schemars_derive"
 version = "0.8.22"
@@ -3772,15 +3452,9 @@ dependencies = [
  "proc-macro2",
  "quote",
  "serde_derive_internals",
- "syn 2.0.106",
+ "syn 2.0.117",
 ]
 
-[[package]]
-name = "scoped-tls"
-version = "1.0.1"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "e1cf6437eb19a8f4a6cc0f7dca544973b0b78843adbfeb3683d1a94a0024a294"
-
 [[package]]
 name = "scopeguard"
 version = "1.2.0"
@@ -3789,78 +3463,73 @@ checksum = "94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49"
 
 [[package]]
 name = "selectors"
-version = "0.24.0"
+version = "0.36.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "0c37578180969d00692904465fb7f6b3d50b9a2b952b87c23d0e2e5cb5013416"
+checksum = "c5d9c0c92a92d33f08817311cf3f2c29a3538a8240e94a6a3c622ce652d7e00c"
 dependencies = [
- "bitflags 1.3.2",
+ "bitflags 2.11.1",
  "cssparser",
  "derive_more",
- "fxhash",
  "log",
- "phf 0.8.0",
- "phf_codegen 0.8.0",
+ "new_debug_unreachable",
+ "phf",
+ "phf_codegen",
  "precomputed-hash",
+ "rustc-hash",
  "servo_arc",
  "smallvec",
 ]
 
 [[package]]
 name = "semver"
-version = "0.11.0"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "f301af10236f6df4160f7c3f04eec6dbc70ace82d23326abad5edee88801c6b6"
-dependencies = [
- "semver-parser",
-]
-
-[[package]]
-name = "semver"
-version = "1.0.14"
+version = "1.0.28"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "e25dfac463d778e353db5be2449d1cce89bd6fd23c9f1ea21310ce6e5a1b29c4"
+checksum = "8a7852d02fc848982e0c167ef163aaff9cd91dc640ba85e263cb1ce46fae51cd"
 dependencies = [
  "serde",
-]
-
-[[package]]
-name = "semver-parser"
-version = "0.10.2"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "00b0bef5b7f9e0df16536d3961cfb6e84331c065b4066afb39768d0e319411f7"
-dependencies = [
- "pest",
+ "serde_core",
 ]
 
 [[package]]
 name = "serde"
-version = "1.0.219"
+version = "1.0.228"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "5f0e2c6ed6606019b4e29e69dbaba95b11854410e5347d525002456dbbb786b6"
+checksum = "9a8e94ea7f378bd32cbbd37198a4a91436180c5bb472411e48b5ec2e2124ae9e"
 dependencies = [
+ "serde_core",
  "serde_derive",
 ]
 
 [[package]]
 name = "serde-untagged"
-version = "0.1.8"
+version = "0.1.9"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "34836a629bcbc6f1afdf0907a744870039b1e14c0561cb26094fa683b158eff3"
+checksum = "f9faf48a4a2d2693be24c6289dbe26552776eb7737074e6722891fadbe6c5058"
 dependencies = [
  "erased-serde",
  "serde",
+ "serde_core",
  "typeid",
 ]
 
+[[package]]
+name = "serde_core"
+version = "1.0.228"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "41d385c7d4ca58e59fc732af25c3983b67ac852c1a25000afe1175de458b67ad"
+dependencies = [
+ "serde_derive",
+]
+
 [[package]]
 name = "serde_derive"
-version = "1.0.219"
+version = "1.0.228"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "5b0276cf7f2c73365f7157c8123c21cd9a50fbbd844757af28ca1f5925fc2a00"
+checksum = "d540f220d3187173da220f885ab66608367b6574e925011a9353e4badda91d79"
 dependencies = [
  "proc-macro2",
  "quote",
- "syn 2.0.106",
+ "syn 2.0.117",
 ]
 
 [[package]]
@@ -3871,48 +3540,49 @@ checksum = "18d26a20a969b9e3fdf2fc2d9f21eda6c40e2de84c9408bb5d3b05d499aae711"
 dependencies = [
  "proc-macro2",
  "quote",
- "syn 2.0.106",
+ "syn 2.0.117",
 ]
 
 [[package]]
 name = "serde_json"
-version = "1.0.142"
+version = "1.0.149"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "030fedb782600dcbd6f02d479bf0d817ac3bb40d644745b769d6a96bc3afc5a7"
+checksum = "83fc039473c5595ace860d8c4fafa220ff474b3fc6bfdb4293327f1a37e94d86"
 dependencies = [
  "itoa",
  "memchr",
- "ryu",
  "serde",
+ "serde_core",
+ "zmij",
 ]
 
 [[package]]
 name = "serde_repr"
-version = "0.1.9"
+version = "0.1.20"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "1fe39d9fbb0ebf5eb2c7cb7e2a47e4f462fad1379f1166b8ae49ad9eae89a7ca"
+checksum = "175ee3e80ae9982737ca543e96133087cbd9a485eecc3bc4de9c1a37b47ea59c"
 dependencies = [
  "proc-macro2",
  "quote",
- "syn 1.0.105",
+ "syn 2.0.117",
 ]
 
 [[package]]
 name = "serde_spanned"
-version = "0.6.4"
+version = "0.6.9"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "12022b835073e5b11e90a14f86838ceb1c8fb0325b72416845c487ac0fa95e80"
+checksum = "bf41e0cfaf7226dca15e8197172c295a782857fcb97fad1808a166870dee75a3"
 dependencies = [
  "serde",
 ]
 
 [[package]]
 name = "serde_spanned"
-version = "1.0.0"
+version = "1.1.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "40734c41988f7306bb04f0ecf60ec0f3f1caa34290e4e8ea471dcd3346483b83"
+checksum = "6662b5879511e06e8999a8a235d848113e942c9124f211511b16466ee2995f26"
 dependencies = [
- "serde",
+ "serde_core",
 ]
 
 [[package]]
@@ -3929,16 +3599,18 @@ dependencies = [
 
 [[package]]
 name = "serde_with"
-version = "3.4.0"
+version = "3.19.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "64cd236ccc1b7a29e7e2739f27c0b2dd199804abc4290e32f59f3b68d6405c23"
+checksum = "f05839ce67618e14a09b286535c0d9c94e85ef25469b0e13cb4f844e5593eb19"
 dependencies = [
- "base64 0.21.5",
+ "base64 0.22.1",
  "chrono",
  "hex",
- "indexmap 1.9.2",
- "indexmap 2.10.0",
- "serde",
+ "indexmap 1.9.3",
+ "indexmap 2.14.0",
+ "schemars 0.9.0",
+ "schemars 1.2.1",
+ "serde_core",
  "serde_json",
  "serde_with_macros",
  "time",
@@ -3946,21 +3618,21 @@ dependencies = [
 
 [[package]]
 name = "serde_with_macros"
-version = "3.4.0"
+version = "3.19.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "93634eb5f75a2323b16de4748022ac4297f9e76b6dced2be287a099f41b5e788"
+checksum = "cf2ebbe86054f9b45bc3881e865683ccfaccce97b9b4cb53f3039d67f355a334"
 dependencies = [
  "darling",
  "proc-macro2",
  "quote",
- "syn 2.0.106",
+ "syn 2.0.117",
 ]
 
 [[package]]
 name = "serialize-to-javascript"
-version = "0.1.1"
+version = "0.1.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "c9823f2d3b6a81d98228151fdeaf848206a7855a7a042bbf9bf870449a66cafb"
+checksum = "04f3666a07a197cdb77cdf306c32be9b7f598d7060d50cfd4d5aa04bfd92f6c5"
 dependencies = [
  "serde",
  "serde_json",
@@ -3969,41 +3641,29 @@ dependencies = [
 
 [[package]]
 name = "serialize-to-javascript-impl"
-version = "0.1.1"
+version = "0.1.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "74064874e9f6a15f04c1f3cb627902d0e6b410abbf36668afa873c61889f1763"
+checksum = "772ee033c0916d670af7860b6e1ef7d658a4629a6d0b4c8c3e67f09b3765b75d"
 dependencies = [
  "proc-macro2",
  "quote",
- "syn 1.0.105",
+ "syn 2.0.117",
 ]
 
 [[package]]
 name = "servo_arc"
-version = "0.2.0"
+version = "0.4.3"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "d52aa42f8fdf0fed91e5ce7f23d8138441002fa31dca008acf47e6fd4721f741"
+checksum = "170fb83ab34de17dc69aa7c67482b22218ddb85da56546f9bd6b929e32a05930"
 dependencies = [
- "nodrop",
  "stable_deref_trait",
 ]
 
-[[package]]
-name = "sha1"
-version = "0.10.5"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "f04293dc80c3993519f2d7f6f511707ee7094fe0c6d3406feb330cdb3540eba3"
-dependencies = [
- "cfg-if",
- "cpufeatures",
- "digest",
-]
-
 [[package]]
 name = "sha2"
-version = "0.10.6"
+version = "0.10.9"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "82e6b795fe2e3b1e845bafcb27aa35405c4d47cdfc92af5fc8d3002f76cebdc0"
+checksum = "a7507d819769d01a365ab707794a4084392c824f54a7a6a7862f8c3d0892b283"
 dependencies = [
  "cfg-if",
  "cpufeatures",
@@ -4050,24 +3710,31 @@ dependencies = [
 
 [[package]]
 name = "signal-hook-registry"
-version = "1.4.6"
+version = "1.4.8"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "b2a4719bff48cee6b39d12c020eeb490953ad2443b7055bd0b21fca26bd8c28b"
+checksum = "c4db69cba1110affc0e9f7bcd48bbf87b3f4fc7c61fc9155afd4c469eb3d6c1b"
 dependencies = [
+ "errno",
  "libc",
 ]
 
+[[package]]
+name = "simd-adler32"
+version = "0.3.9"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "703d5c7ef118737c72f1af64ad2f6f8c5e1921f818cdcb97b8fe6fc69bf66214"
+
 [[package]]
 name = "siphasher"
-version = "0.3.10"
+version = "1.0.3"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "7bd3e3206899af3f8b12af284fafc038cc1dc2b41d1b89dd17297221c5d225de"
+checksum = "8ee5873ec9cce0195efcb7a4e9507a04cd49aec9c83d0389df45b1ef7ba2e649"
 
 [[package]]
 name = "slab"
-version = "0.4.11"
+version = "0.4.12"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "7a2ae44ef20feb57a68b23d846850f861394c2e02dc425a50098ae8c90267589"
+checksum = "0c790de23124f9ab44544d7ac05d60440adc586479ce501c1d6d7da3cd8c9cf5"
 
 [[package]]
 name = "smallvec"
@@ -4077,44 +3744,34 @@ checksum = "67b1b7a3b5fe4f1376887184045fcf45c69e92af734b7aaddc05fb777b6fbd03"
 
 [[package]]
 name = "socket2"
-version = "0.4.10"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "9f7916fc008ca5542385b89a3d3ce689953c143e9304a9bf8beec1de48994c0d"
-dependencies = [
- "libc",
- "winapi",
-]
-
-[[package]]
-name = "socket2"
-version = "0.5.10"
+version = "0.6.3"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "e22376abed350d73dd1cd119b57ffccad95b4e585a7cda43e286245ce23c0678"
+checksum = "3a766e1110788c36f4fa1c2b71b387a7815aa65f88ce0229841826633d93723e"
 dependencies = [
  "libc",
- "windows-sys 0.52.0",
+ "windows-sys 0.61.2",
 ]
 
 [[package]]
 name = "softbuffer"
-version = "0.4.6"
+version = "0.4.8"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "18051cdd562e792cad055119e0cdb2cfc137e44e3987532e0f9659a77931bb08"
+checksum = "aac18da81ebbf05109ab275b157c22a653bb3c12cf884450179942f81bcbf6c3"
 dependencies = [
  "bytemuck",
- "cfg_aliases",
- "core-graphics 0.24.0",
- "foreign-types 0.5.0",
  "js-sys",
- "log",
- "objc2 0.5.2",
- "objc2-foundation 0.2.2",
- "objc2-quartz-core 0.2.2",
+ "ndk",
+ "objc2",
+ "objc2-core-foundation",
+ "objc2-core-graphics",
+ "objc2-foundation",
+ "objc2-quartz-core",
  "raw-window-handle",
- "redox_syscall 0.5.17",
+ "redox_syscall",
+ "tracing",
  "wasm-bindgen",
  "web-sys",
- "windows-sys 0.59.0",
+ "windows-sys 0.61.2",
 ]
 
 [[package]]
@@ -4143,61 +3800,41 @@ dependencies = [
  "system-deps",
 ]
 
-[[package]]
-name = "spin"
-version = "0.9.8"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "6980e8d7511241f8acf4aebddbb1ff938df5eebe98691418c4468d0b72a96a67"
-
 [[package]]
 name = "stable_deref_trait"
-version = "1.2.0"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "a8f112729512f8e442d81f95a8a7ddf2b7c6b8a1a6f509a95864142b30cab2d3"
-
-[[package]]
-name = "static_assertions"
-version = "1.1.0"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "a2eb9349b6444b326872e140eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f"
-
-[[package]]
-name = "str-buf"
-version = "1.0.6"
+version = "1.2.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "9e08d8363704e6c71fc928674353e6b7c23dcea9d82d7012c8faf2a3a025f8d0"
+checksum = "6ce2be8dc25455e1f91df71bfa12ad37d7af1092ae736f3a6cd0e37bc7810596"
 
 [[package]]
 name = "string_cache"
-version = "0.8.4"
+version = "0.9.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "213494b7a2b503146286049378ce02b482200519accc31872ee8be91fa820a08"
+checksum = "a18596f8c785a729f2819c0f6a7eae6ebeebdfffbfe4214ae6b087f690e31901"
 dependencies = [
  "new_debug_unreachable",
- "once_cell",
  "parking_lot",
- "phf_shared 0.10.0",
+ "phf_shared",
  "precomputed-hash",
- "serde",
 ]
 
 [[package]]
 name = "string_cache_codegen"
-version = "0.5.2"
+version = "0.6.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "6bb30289b722be4ff74a408c3cc27edeaad656e06cb1fe8fa9231fa59c728988"
+checksum = "585635e46db231059f76c5849798146164652513eb9e8ab2685939dd90f29b69"
 dependencies = [
- "phf_generator 0.10.0",
- "phf_shared 0.10.0",
+ "phf_generator",
+ "phf_shared",
  "proc-macro2",
  "quote",
 ]
 
 [[package]]
 name = "strsim"
-version = "0.10.0"
+version = "0.11.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "73473c0e59e6d5812c5dfe2a064a6444949f089e20eec9a2e5506596494e4623"
+checksum = "7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f"
 
 [[package]]
 name = "subtle"
@@ -4211,27 +3848,26 @@ version = "1.0.7"
 source = "registry+https://github.com/rust-lang/crates.io-index"
 checksum = "4057c98e2e852d51fdcfca832aac7b571f6b351ad159f9eda5db1655f8d0c4d7"
 dependencies = [
- "base64 0.21.5",
+ "base64 0.21.7",
  "serde",
  "serde_json",
 ]
 
 [[package]]
 name = "syn"
-version = "1.0.105"
+version = "1.0.109"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "60b9b43d45702de4c839cb9b51d9f529c5dd26a4aff255b42b1ebc03e88ee908"
+checksum = "72b64191b275b66ffe2469e8af2c1cfe3bafa67b529ead792a6d0160888b4237"
 dependencies = [
  "proc-macro2",
- "quote",
  "unicode-ident",
 ]
 
 [[package]]
 name = "syn"
-version = "2.0.106"
+version = "2.0.117"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "ede7c438028d4436d71104916910f5bb611972c5cfd7f89b8300a8186e6fada6"
+checksum = "e665b8803e7b1d2a727f4023456bbbbe74da67099c585258af0ad9c5013b9b99"
 dependencies = [
  "proc-macro2",
  "quote",
@@ -4240,9 +3876,12 @@ dependencies = [
 
 [[package]]
 name = "sync_wrapper"
-version = "0.1.2"
+version = "1.0.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "2047c6ded9c721764247e62cd3b03c09ffc529b2ba5b10ec482ae507a4a70160"
+checksum = "0bf256ce5efdfa370213c1dabab5935a12e49f2c58d15e9eac2870d3b4f27263"
+dependencies = [
+ "futures-core",
+]
 
 [[package]]
 name = "synstructure"
@@ -4252,7 +3891,7 @@ checksum = "728a70f3dbaf5bab7f0c4b1ac8d7ae5ea60a4b5549c8a5914361c99147a709d2"
 dependencies = [
  "proc-macro2",
  "quote",
- "syn 2.0.106",
+ "syn 2.0.117",
 ]
 
 [[package]]
@@ -4266,20 +3905,20 @@ dependencies = [
 
 [[package]]
 name = "system-configuration"
-version = "0.5.1"
+version = "0.7.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "ba3a3adc5c275d719af8cb4272ea1c4a6d668a777f37e115f6d11ddbc1c8e0e7"
+checksum = "a13f3d0daba03132c0aa9767f98351b3488edc2c100cda2d2ec2b04f3d8d3c8b"
 dependencies = [
- "bitflags 1.3.2",
- "core-foundation 0.9.3",
+ "bitflags 2.11.1",
+ "core-foundation 0.9.4",
  "system-configuration-sys",
 ]
 
 [[package]]
 name = "system-configuration-sys"
-version = "0.5.0"
+version = "0.6.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "a75fb188eb626b924683e3b95e3a48e63551fcfb51949de2f06a9d91dbee93c9"
+checksum = "8e1d1b10ced5ca923a1fcb8d03e96b8d3268065d724548c0211415ff6ac6bac4"
 dependencies = [
  "core-foundation-sys",
  "libc",
@@ -4287,52 +3926,52 @@ dependencies = [
 
 [[package]]
 name = "system-deps"
-version = "6.0.3"
+version = "6.2.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "2955b1fe31e1fa2fbd1976b71cc69a606d7d4da16f6de3333d0c92d51419aeff"
+checksum = "a3e535eb8dded36d55ec13eddacd30dec501792ff23a0b1682c38601b8cf2349"
 dependencies = [
  "cfg-expr",
- "heck 0.4.0",
+ "heck 0.5.0",
  "pkg-config",
- "toml 0.5.9",
+ "toml 0.8.2",
  "version-compare",
 ]
 
 [[package]]
 name = "tao"
-version = "0.34.2"
+version = "0.35.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "4daa814018fecdfb977b59a094df4bd43b42e8e21f88fddfc05807e6f46efaaf"
+checksum = "a33f7f9e486ade65fcf1e45c440f9236c904f5c1002cdc7fc6ae582777345ce4"
 dependencies = [
- "bitflags 2.8.0",
- "block2 0.6.1",
+ "bitflags 2.11.1",
+ "block2",
  "core-foundation 0.10.1",
- "core-graphics 0.24.0",
+ "core-graphics",
  "crossbeam-channel",
- "dispatch",
+ "dbus",
+ "dispatch2",
  "dlopen2",
  "dpi",
  "gdkwayland-sys",
  "gdkx11-sys",
  "gtk",
  "jni",
- "lazy_static",
  "libc",
  "log",
  "ndk",
- "ndk-context",
  "ndk-sys",
- "objc2 0.6.2",
- "objc2-app-kit 0.3.1",
- "objc2-foundation 0.3.1",
+ "objc2",
+ "objc2-app-kit",
+ "objc2-foundation",
+ "objc2-ui-kit",
  "once_cell",
  "parking_lot",
+ "percent-encoding",
  "raw-window-handle",
- "scopeguard",
  "tao-macros",
  "unicode-segmentation",
  "url",
- "windows 0.61.3",
+ "windows",
  "windows-core 0.61.2",
  "windows-version",
  "x11-dl",
@@ -4340,27 +3979,34 @@ dependencies = [
 
 [[package]]
 name = "tao-macros"
-version = "0.1.2"
+version = "0.1.3"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "ec114582505d158b669b136e6851f85840c109819d77c42bb7c0709f727d18c2"
+checksum = "f4e16beb8b2ac17db28eab8bca40e62dbfbb34c0fcdc6d9826b11b7b5d047dfd"
 dependencies = [
  "proc-macro2",
  "quote",
- "syn 1.0.105",
+ "syn 2.0.117",
 ]
 
+[[package]]
+name = "target-lexicon"
+version = "0.12.16"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "61c41af27dd6d1e27b1b16b489db798443478cef1f06a660c96db617ba5de3b1"
+
 [[package]]
 name = "tauri"
-version = "2.7.0"
+version = "2.11.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "352a4bc7bf6c25f5624227e3641adf475a6535707451b09bb83271df8b7a6ac7"
+checksum = "b93bd86d231f0a8138f11a02a584769fe4b703dc36ae133d783228dbc4801405"
 dependencies = [
  "anyhow",
  "bytes",
+ "cookie",
  "dirs",
  "dunce",
  "embed_plist",
- "getrandom 0.3.3",
+ "getrandom 0.3.4",
  "glob",
  "gtk",
  "heck 0.5.0",
@@ -4370,14 +4016,15 @@ dependencies = [
  "log",
  "mime",
  "muda",
- "objc2 0.6.2",
- "objc2-app-kit 0.3.1",
- "objc2-foundation 0.3.1",
+ "objc2",
+ "objc2-app-kit",
+ "objc2-foundation",
  "objc2-ui-kit",
+ "objc2-web-kit",
  "percent-encoding",
  "plist",
  "raw-window-handle",
- "reqwest",
+ "reqwest 0.13.3",
  "serde",
  "serde_json",
  "serde_repr",
@@ -4388,22 +4035,21 @@ dependencies = [
  "tauri-runtime",
  "tauri-runtime-wry",
  "tauri-utils",
- "thiserror 2.0.15",
+ "thiserror 2.0.18",
  "tokio",
  "tray-icon",
  "url",
- "urlpattern",
  "webkit2gtk",
  "webview2-com",
  "window-vibrancy",
- "windows 0.61.3",
+ "windows",
 ]
 
 [[package]]
 name = "tauri-build"
-version = "2.3.1"
+version = "2.6.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "182d688496c06bf08ea896459bf483eb29cdff35c1c4c115fb14053514303064"
+checksum = "3a318b234cc2dea65f575467bafcfb76286bce228ebc3778e337d61d03213007"
 dependencies = [
  "anyhow",
  "cargo_toml",
@@ -4411,37 +4057,36 @@ dependencies = [
  "glob",
  "heck 0.5.0",
  "json-patch",
- "schemars",
- "semver 1.0.14",
+ "schemars 0.8.22",
+ "semver",
  "serde",
  "serde_json",
  "tauri-utils",
  "tauri-winres",
- "toml 0.8.2",
  "walkdir",
 ]
 
 [[package]]
 name = "tauri-codegen"
-version = "2.3.1"
+version = "2.6.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "b54a99a6cd8e01abcfa61508177e6096a4fe2681efecee9214e962f2f073ae4a"
+checksum = "6bd11644962add2549a60b7e7c6800f17d7020156e02f516021d8103e80cc528"
 dependencies = [
  "base64 0.22.1",
  "brotli",
  "ico",
  "json-patch",
  "plist",
- "png",
+ "png 0.17.16",
  "proc-macro2",
  "quote",
- "semver 1.0.14",
+ "semver",
  "serde",
  "serde_json",
  "sha2",
- "syn 2.0.106",
+ "syn 2.0.117",
  "tauri-utils",
- "thiserror 2.0.15",
+ "thiserror 2.0.18",
  "time",
  "url",
  "uuid",
@@ -4450,40 +4095,39 @@ dependencies = [
 
 [[package]]
 name = "tauri-macros"
-version = "2.3.2"
+version = "2.6.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "7945b14dc45e23532f2ded6e120170bbdd4af5ceaa45784a6b33d250fbce3f9e"
+checksum = "fed9d3742a37a355d2e47c9af924e9fbc112abb76f9835d35d4780e318419502"
 dependencies = [
  "heck 0.5.0",
  "proc-macro2",
  "quote",
- "syn 2.0.106",
+ "syn 2.0.117",
  "tauri-codegen",
  "tauri-utils",
 ]
 
 [[package]]
 name = "tauri-plugin"
-version = "2.3.1"
+version = "2.6.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "5bd5c1e56990c70a906ef67a9851bbdba9136d26075ee9a2b19c8b46986b3e02"
+checksum = "eefb2c18e8a605c23edb48fc56bb77381199e1a1e7f6ff0c9b970afe7b3cb8ee"
 dependencies = [
  "anyhow",
  "glob",
  "plist",
- "schemars",
+ "schemars 0.8.22",
  "serde",
  "serde_json",
  "tauri-utils",
- "toml 0.8.2",
  "walkdir",
 ]
 
 [[package]]
 name = "tauri-plugin-clipboard-manager"
-version = "2.3.0"
+version = "2.3.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "adddd9e9275b20e77af3061d100a25a884cced3c4c9ef680bd94dd0f7e26c1ca"
+checksum = "206dc20af4ed210748ba945c2774e60fd0acd52b9a73a028402caf809e9b6ecf"
 dependencies = [
  "arboard",
  "log",
@@ -4491,14 +4135,14 @@ dependencies = [
  "serde_json",
  "tauri",
  "tauri-plugin",
- "thiserror 2.0.15",
+ "thiserror 2.0.18",
 ]
 
 [[package]]
 name = "tauri-plugin-dialog"
-version = "2.3.2"
+version = "2.7.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "37e5858cc7b455a73ab4ea2ebc08b5be33682c00ff1bf4cad5537d4fb62499d9"
+checksum = "65981abb771e74e571a38196c3baa11c459379164791eba0e67abc1a5fac9884"
 dependencies = [
  "log",
  "raw-window-handle",
@@ -4508,37 +4152,39 @@ dependencies = [
  "tauri",
  "tauri-plugin",
  "tauri-plugin-fs",
- "thiserror 2.0.15",
+ "thiserror 2.0.18",
  "url",
 ]
 
 [[package]]
 name = "tauri-plugin-fs"
-version = "2.4.1"
+version = "2.5.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "8c6ef84ee2f2094ce093e55106d90d763ba343fad57566992962e8f76d113f99"
+checksum = "b7ecc274121aca0c036a2b42d1cbe83d368d348f54e0bb8a735c2b1548e8f371"
 dependencies = [
  "anyhow",
  "dunce",
  "glob",
+ "log",
+ "objc2-foundation",
  "percent-encoding",
- "schemars",
+ "schemars 0.8.22",
  "serde",
  "serde_json",
  "serde_repr",
  "tauri",
  "tauri-plugin",
  "tauri-utils",
- "thiserror 2.0.15",
- "toml 0.8.2",
+ "thiserror 2.0.18",
+ "toml 1.1.2+spec-1.1.0",
  "url",
 ]
 
 [[package]]
 name = "tauri-plugin-global-shortcut"
-version = "2.3.0"
+version = "2.3.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "6df9f0f7bf2fe768b85fee4951c2505a35b72c44df1f6403e74e110bc13c5f58"
+checksum = "424af23c7e88d05e4a1a6fc2c7be077912f8c76bd7900fd50aa2b7cbf5a2c405"
 dependencies = [
  "global-hotkey",
  "log",
@@ -4546,28 +4192,28 @@ dependencies = [
  "serde_json",
  "tauri",
  "tauri-plugin",
- "thiserror 2.0.15",
+ "thiserror 2.0.18",
 ]
 
 [[package]]
 name = "tauri-plugin-http"
-version = "2.5.1"
+version = "2.5.9"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "fcde333d97e565a7765aad82f32d8672458f7bd77b6ee653830d5dded9d7b5c2"
+checksum = "b5bd512048e1985b7ec78f96d99083e2ddaf7e0d906b2b63c44ce5bb8b894067"
 dependencies = [
  "bytes",
- "cookie_store 0.21.1",
+ "cookie_store",
  "data-url",
  "http",
  "regex",
- "reqwest",
- "schemars",
+ "reqwest 0.12.28",
+ "schemars 0.8.22",
  "serde",
  "serde_json",
  "tauri",
  "tauri-plugin",
  "tauri-plugin-fs",
- "thiserror 2.0.15",
+ "thiserror 2.0.18",
  "tokio",
  "url",
  "urlpattern",
@@ -4575,45 +4221,45 @@ dependencies = [
 
 [[package]]
 name = "tauri-plugin-localhost"
-version = "2.3.0"
+version = "2.3.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "135932ae4cd4fa697f9604160bfb5ef0b0be37bf61e778325666d01cc0497f33"
+checksum = "1c8d72c024121b1a3d9268293d49a56baf01a8c785561c85d17872588b839e55"
 dependencies = [
  "http",
  "log",
  "serde",
  "serde_json",
  "tauri",
- "thiserror 2.0.15",
+ "thiserror 2.0.18",
  "tiny_http",
 ]
 
 [[package]]
 name = "tauri-plugin-notification"
-version = "2.3.0"
+version = "2.3.3"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "cfe06ed89cff6d0ec06ff4f544fb961e4718348a33309f56ccb2086e77bc9116"
+checksum = "01fc2c5ff41105bd1f7242d8201fdf3efd70749b82fa013a17f2126357d194cc"
 dependencies = [
  "log",
  "notify-rust",
- "rand 0.8.5",
+ "rand",
  "serde",
  "serde_json",
  "serde_repr",
  "tauri",
  "tauri-plugin",
- "thiserror 2.0.15",
+ "thiserror 2.0.18",
  "time",
  "url",
 ]
 
 [[package]]
 name = "tauri-plugin-os"
-version = "2.3.0"
+version = "2.3.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "05bccb4c6de4299beec5a9b070878a01bce9e2c945aa7a75bcea38bcba4c675d"
+checksum = "d8f08346c8deb39e96f86973da0e2d76cbb933d7ac9b750f6dc4daf955a6f997"
 dependencies = [
- "gethostname 1.0.2",
+ "gethostname",
  "log",
  "os_info",
  "serde",
@@ -4622,14 +4268,14 @@ dependencies = [
  "sys-locale",
  "tauri",
  "tauri-plugin",
- "thiserror 2.0.15",
+ "thiserror 2.0.18",
 ]
 
 [[package]]
 name = "tauri-plugin-process"
-version = "2.3.0"
+version = "2.3.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "7461c622a5ea00eb9cd9f7a08dbd3bf79484499fd5c21aa2964677f64ca651ab"
+checksum = "d55511a7bf6cd70c8767b02c97bf8134fa434daf3926cfc1be0a0f94132d165a"
 dependencies = [
  "tauri",
  "tauri-plugin",
@@ -4637,75 +4283,77 @@ dependencies = [
 
 [[package]]
 name = "tauri-plugin-shell"
-version = "2.3.0"
+version = "2.3.5"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "2b9ffadec5c3523f11e8273465cacb3d86ea7652a28e6e2a2e9b5c182f791d25"
+checksum = "8457dbf9e2bab1edd8df22bb2c20857a59a9868e79cb3eac5ed639eec4d0c73b"
 dependencies = [
  "encoding_rs",
  "log",
  "open",
  "os_pipe",
  "regex",
- "schemars",
+ "schemars 0.8.22",
  "serde",
  "serde_json",
  "shared_child",
  "tauri",
  "tauri-plugin",
- "thiserror 2.0.15",
+ "thiserror 2.0.18",
  "tokio",
 ]
 
 [[package]]
 name = "tauri-plugin-window-state"
-version = "2.4.0"
+version = "2.4.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "2d5f6fe3291bfa609c7e0b0ee3bedac294d94c7018934086ce782c1d0f2a468e"
+checksum = "73736611e14142408d15353e21e3cca2f12a3cfb523ad0ce85999b6d2ef1a704"
 dependencies = [
- "bitflags 2.8.0",
+ "bitflags 2.11.1",
  "log",
  "serde",
  "serde_json",
  "tauri",
  "tauri-plugin",
- "thiserror 2.0.15",
+ "thiserror 2.0.18",
 ]
 
 [[package]]
 name = "tauri-runtime"
-version = "2.7.1"
+version = "2.11.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "2b1cc885be806ea15ff7b0eb47098a7b16323d9228876afda329e34e2d6c4676"
+checksum = "8fef478ba1d2ac21c2d528740b24d0cb315e1e8b1111aae53fafac34804371fc"
 dependencies = [
- "cookie 0.18.1",
+ "cookie",
  "dpi",
  "gtk",
  "http",
  "jni",
- "objc2 0.6.2",
+ "objc2",
  "objc2-ui-kit",
+ "objc2-web-kit",
  "raw-window-handle",
  "serde",
  "serde_json",
  "tauri-utils",
- "thiserror 2.0.15",
+ "thiserror 2.0.18",
  "url",
- "windows 0.61.3",
+ "webkit2gtk",
+ "webview2-com",
+ "windows",
 ]
 
 [[package]]
 name = "tauri-runtime-wry"
-version = "2.7.2"
+version = "2.11.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "fe653a2fbbef19fe898efc774bc52c8742576342a33d3d028c189b57eb1d2439"
+checksum = "a3989df2ae1c476404fe0a2e8ffc4cfbde97e51efd613c2bb5355fbc9ab52cf0"
 dependencies = [
  "gtk",
  "http",
  "jni",
  "log",
- "objc2 0.6.2",
- "objc2-app-kit 0.3.1",
- "objc2-foundation 0.3.1",
+ "objc2",
+ "objc2-app-kit",
  "once_cell",
  "percent-encoding",
  "raw-window-handle",
@@ -4716,42 +4364,42 @@ dependencies = [
  "url",
  "webkit2gtk",
  "webview2-com",
- "windows 0.61.3",
+ "windows",
  "wry",
 ]
 
 [[package]]
 name = "tauri-utils"
-version = "2.6.0"
+version = "2.9.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "9330c15cabfe1d9f213478c9e8ec2b0c76dab26bb6f314b8ad1c8a568c1d186e"
+checksum = "d57200389a2f82b4b0a40ae29ca19b6978116e8f4d4e974c3234ce40c0ffbdec"
 dependencies = [
  "anyhow",
  "brotli",
  "cargo_metadata",
  "ctor",
+ "dom_query",
  "dunce",
  "glob",
- "html5ever",
  "http",
  "infer",
  "json-patch",
- "kuchikiki",
  "log",
  "memchr",
- "phf 0.11.2",
+ "phf",
+ "plist",
  "proc-macro2",
  "quote",
  "regex",
- "schemars",
- "semver 1.0.14",
+ "schemars 0.8.22",
+ "semver",
  "serde",
  "serde-untagged",
  "serde_json",
  "serde_with",
  "swift-rs",
- "thiserror 2.0.15",
- "toml 0.8.2",
+ "thiserror 2.0.18",
+ "toml 1.1.2+spec-1.1.0",
  "url",
  "urlpattern",
  "uuid",
@@ -4760,125 +4408,132 @@ dependencies = [
 
 [[package]]
 name = "tauri-winres"
-version = "0.3.3"
+version = "0.3.6"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "fd21509dd1fa9bd355dc29894a6ff10635880732396aa38c0066c1e6c1ab8074"
+checksum = "cc65d45c68858bfe420dd29e834b5d15dbecf8a07a8a16cf4d532c7b1f69d4b6"
 dependencies = [
+ "dunce",
  "embed-resource",
- "toml 0.9.5",
+ "toml 1.1.2+spec-1.1.0",
 ]
 
 [[package]]
 name = "tauri-winrt-notification"
-version = "0.2.1"
+version = "0.7.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "f89f5fb70d6f62381f5d9b2ba9008196150b40b75f3068eb24faeddf1c686871"
+checksum = "0b1e66e07de489fe43a46678dd0b8df65e0c973909df1b60ba33874e297ba9b9"
 dependencies = [
- "quick-xml 0.31.0",
- "windows 0.56.0",
+ "quick-xml 0.37.5",
+ "thiserror 2.0.18",
+ "windows",
  "windows-version",
 ]
 
 [[package]]
 name = "tempfile"
-version = "3.3.0"
+version = "3.27.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "5cdb1ef4eaeeaddc8fbd371e5017057064af0911902ef36b39801f67cc6d79e4"
+checksum = "32497e9a4c7b38532efcdebeef879707aa9f794296a4f0244f6f69e9bc8574bd"
 dependencies = [
- "cfg-if",
- "fastrand 1.8.0",
- "libc",
- "redox_syscall 0.2.16",
- "remove_dir_all",
- "winapi",
+ "fastrand",
+ "getrandom 0.4.2",
+ "once_cell",
+ "rustix",
+ "windows-sys 0.61.2",
 ]
 
 [[package]]
 name = "tendril"
-version = "0.4.3"
+version = "0.5.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "d24a120c5fc464a3458240ee02c299ebcb9d67b5249c8848b09d639dca8d7bb0"
+checksum = "c4790fc369d5a530f4b544b094e31388b9b3a37c0f4652ade4505945f5660d24"
 dependencies = [
- "futf",
- "mac",
+ "new_debug_unreachable",
  "utf-8",
 ]
 
 [[package]]
 name = "thiserror"
-version = "1.0.50"
+version = "1.0.69"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "f9a7210f5c9a7156bb50aa36aed4c95afb51df0df00713949448cf9e97d382d2"
+checksum = "b6aaf5339b578ea85b50e080feb250a3e8ae8cfcdff9a461c9ec2904bc923f52"
 dependencies = [
- "thiserror-impl 1.0.50",
+ "thiserror-impl 1.0.69",
 ]
 
 [[package]]
 name = "thiserror"
-version = "2.0.15"
+version = "2.0.18"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "80d76d3f064b981389ecb4b6b7f45a0bf9fdac1d5b9204c7bd6714fecc302850"
+checksum = "4288b5bcbc7920c07a1149a35cf9590a2aa808e0bc1eafaade0b80947865fbc4"
 dependencies = [
- "thiserror-impl 2.0.15",
+ "thiserror-impl 2.0.18",
 ]
 
 [[package]]
 name = "thiserror-impl"
-version = "1.0.50"
+version = "1.0.69"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "266b2e40bc00e5a6c09c3584011e08b06f123c00362c92b975ba9843aaaa14b8"
+checksum = "4fee6c4efc90059e10f81e6d42c60a18f76588c3d74cb83a0b242a2b6c7504c1"
 dependencies = [
  "proc-macro2",
  "quote",
- "syn 2.0.106",
+ "syn 2.0.117",
 ]
 
 [[package]]
 name = "thiserror-impl"
-version = "2.0.15"
+version = "2.0.18"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "44d29feb33e986b6ea906bd9c3559a856983f92371b3eaa5e83782a351623de0"
+checksum = "ebc4ee7f67670e9b64d05fa4253e753e016c6c95ff35b89b7941d6b856dec1d5"
 dependencies = [
  "proc-macro2",
  "quote",
- "syn 2.0.106",
+ "syn 2.0.117",
 ]
 
 [[package]]
 name = "tiff"
-version = "0.8.1"
+version = "0.11.3"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "7449334f9ff2baf290d55d73983a7d6fa15e01198faef72af07e2a8db851e471"
+checksum = "b63feaf3343d35b6ca4d50483f94843803b0f51634937cc2ec519fc32232bc52"
 dependencies = [
+ "fax",
  "flate2",
- "jpeg-decoder",
+ "half",
+ "quick-error",
  "weezl",
+ "zune-jpeg",
 ]
 
 [[package]]
 name = "time"
-version = "0.3.17"
+version = "0.3.47"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "a561bf4617eebd33bca6434b988f39ed798e527f51a1e797d0ee4f61c0a38376"
+checksum = "743bd48c283afc0388f9b8827b976905fb217ad9e647fae3a379a9283c4def2c"
 dependencies = [
+ "deranged",
  "itoa",
- "serde",
+ "num-conv",
+ "powerfmt",
+ "serde_core",
  "time-core",
  "time-macros",
 ]
 
 [[package]]
 name = "time-core"
-version = "0.1.0"
+version = "0.1.8"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "2e153e1f1acaef8acc537e68b44906d2db6436e2b35ac2c6b42640fff91f00fd"
+checksum = "7694e1cfe791f8d31026952abf09c69ca6f6fa4e1a1229e18988f06a04a12dca"
 
 [[package]]
 name = "time-macros"
-version = "0.2.6"
+version = "0.2.27"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "d967f99f534ca7e495c575c62638eebc2898a8c84c119b89e250477bc4ba16b2"
+checksum = "2e70e4c5a0e0a8a4823ad65dfe1a6930e4f4d756dcd9dd7939022b5e8c501215"
 dependencies = [
+ "num-conv",
  "time-core",
 ]
 
@@ -4896,9 +4551,9 @@ dependencies = [
 
 [[package]]
 name = "tinystr"
-version = "0.8.1"
+version = "0.8.3"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "5d4f6d1145dcb577acf783d4e601bc1d76a13337bb54e6233add580b07344c8b"
+checksum = "c8323304221c2a851516f22236c5722a72eaa19749016521d6dff0824447d96d"
 dependencies = [
  "displaydoc",
  "zerovec",
@@ -4906,9 +4561,9 @@ dependencies = [
 
 [[package]]
 name = "tinyvec"
-version = "1.9.0"
+version = "1.11.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "09b3661f17e86524eccd4371ab0429194e0d7c008abb45f7a7495b1719463c71"
+checksum = "3e61e67053d25a4e82c844e8424039d9745781b3fc4f32b8d55ed50f5f667ef3"
 dependencies = [
  "tinyvec_macros",
 ]
@@ -4921,94 +4576,93 @@ checksum = "1f3ccbac311fea05f86f61904b462b55fb3df8837a366dfc601a0161d0532f20"
 
 [[package]]
 name = "tokio"
-version = "1.23.0"
+version = "1.52.3"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "eab6d665857cc6ca78d6e80303a02cea7a7851e85dfbd77cbdc09bd129f1ef46"
+checksum = "8fc7f01b389ac15039e4dc9531aa973a135d7a4135281b12d7c1bc79fd57fffe"
 dependencies = [
- "autocfg",
  "bytes",
  "libc",
- "memchr",
  "mio",
- "num_cpus",
  "pin-project-lite",
- "signal-hook-registry",
- "socket2 0.4.10",
+ "socket2",
  "tokio-macros",
- "tracing",
- "windows-sys 0.42.0",
+ "windows-sys 0.61.2",
 ]
 
 [[package]]
 name = "tokio-macros"
-version = "1.8.2"
+version = "2.7.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "d266c00fde287f55d3f1c3e96c500c362a2b8c695076ec180f27918820bc6df8"
+checksum = "385a6cb71ab9ab790c5fe8d67f1645e6c450a7ce006a33de03daa956cf70a496"
 dependencies = [
  "proc-macro2",
  "quote",
- "syn 1.0.105",
+ "syn 2.0.117",
 ]
 
 [[package]]
 name = "tokio-rustls"
-version = "0.25.0"
+version = "0.26.4"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "775e0c0f0adb3a2f22a00c4745d728b479985fc15ee7ca6a2608388c5569860f"
+checksum = "1729aa945f29d91ba541258c8df89027d5792d85a8841fb65e8bf0f4ede4ef61"
 dependencies = [
  "rustls",
- "rustls-pki-types",
  "tokio",
 ]
 
 [[package]]
 name = "tokio-util"
-version = "0.7.8"
+version = "0.7.18"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "806fe8c2c87eccc8b3267cbae29ed3ab2d0bd37fca70ab622e46aaa9375ddb7d"
+checksum = "9ae9cec805b01e8fc3fd2fe289f89149a9b66dd16786abd8b19cfa7b48cb0098"
 dependencies = [
  "bytes",
  "futures-core",
  "futures-sink",
  "pin-project-lite",
  "tokio",
- "tracing",
 ]
 
 [[package]]
 name = "toml"
-version = "0.5.9"
+version = "0.8.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "8d82e1a7758622a465f8cee077614c73484dac5b836c02ff6a40d5d1010324d7"
+checksum = "185d8ab0dfbb35cf1399a6344d8484209c088f75f8f68230da55d48d95d43e3d"
 dependencies = [
  "serde",
+ "serde_spanned 0.6.9",
+ "toml_datetime 0.6.3",
+ "toml_edit 0.20.2",
 ]
 
 [[package]]
 name = "toml"
-version = "0.8.2"
+version = "0.9.12+spec-1.1.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "185d8ab0dfbb35cf1399a6344d8484209c088f75f8f68230da55d48d95d43e3d"
+checksum = "cf92845e79fc2e2def6a5d828f0801e29a2f8acc037becc5ab08595c7d5e9863"
 dependencies = [
- "serde",
- "serde_spanned 0.6.4",
- "toml_datetime 0.6.3",
- "toml_edit",
+ "indexmap 2.14.0",
+ "serde_core",
+ "serde_spanned 1.1.1",
+ "toml_datetime 0.7.5+spec-1.1.0",
+ "toml_parser",
+ "toml_writer",
+ "winnow 0.7.15",
 ]
 
 [[package]]
 name = "toml"
-version = "0.9.5"
+version = "1.1.2+spec-1.1.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "75129e1dc5000bfbaa9fee9d1b21f974f9fbad9daec557a521ee6e080825f6e8"
+checksum = "81f3d15e84cbcd896376e6730314d59fb5a87f31e4b038454184435cd57defee"
 dependencies = [
- "indexmap 2.10.0",
- "serde",
- "serde_spanned 1.0.0",
- "toml_datetime 0.7.0",
+ "indexmap 2.14.0",
+ "serde_core",
+ "serde_spanned 1.1.1",
+ "toml_datetime 1.1.1+spec-1.1.0",
  "toml_parser",
  "toml_writer",
- "winnow 0.7.12",
+ "winnow 1.0.2",
 ]
 
 [[package]]
@@ -5022,11 +4676,31 @@ dependencies = [
 
 [[package]]
 name = "toml_datetime"
-version = "0.7.0"
+version = "0.7.5+spec-1.1.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "bade1c3e902f58d73d3f294cd7f20391c1cb2fbcb643b73566bc773971df91e3"
+checksum = "92e1cfed4a3038bc5a127e35a2d360f145e1f4b971b551a2ba5fd7aedf7e1347"
 dependencies = [
- "serde",
+ "serde_core",
+]
+
+[[package]]
+name = "toml_datetime"
+version = "1.1.1+spec-1.1.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "3165f65f62e28e0115a00b2ebdd37eb6f3b641855f9d636d3cd4103767159ad7"
+dependencies = [
+ "serde_core",
+]
+
+[[package]]
+name = "toml_edit"
+version = "0.19.15"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "1b5bb770da30e5cbfde35a2d7b9b8a2c4b8ef89548a7a6aeab5c9a576e3e7421"
+dependencies = [
+ "indexmap 2.14.0",
+ "toml_datetime 0.6.3",
+ "winnow 0.5.40",
 ]
 
 [[package]]
@@ -5035,43 +4709,73 @@ version = "0.20.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
 checksum = "396e4d48bbb2b7554c944bde63101b5ae446cff6ec4a24227428f15eb72ef338"
 dependencies = [
- "indexmap 2.10.0",
+ "indexmap 2.14.0",
  "serde",
- "serde_spanned 0.6.4",
+ "serde_spanned 0.6.9",
  "toml_datetime 0.6.3",
- "winnow 0.5.17",
+ "winnow 0.5.40",
+]
+
+[[package]]
+name = "toml_edit"
+version = "0.25.11+spec-1.1.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "0b59c4d22ed448339746c59b905d24568fcbb3ab65a500494f7b8c3e97739f2b"
+dependencies = [
+ "indexmap 2.14.0",
+ "toml_datetime 1.1.1+spec-1.1.0",
+ "toml_parser",
+ "winnow 1.0.2",
 ]
 
 [[package]]
 name = "toml_parser"
-version = "1.0.2"
+version = "1.1.2+spec-1.1.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "b551886f449aa90d4fe2bdaa9f4a2577ad2dde302c61ecf262d80b116db95c10"
+checksum = "a2abe9b86193656635d2411dc43050282ca48aa31c2451210f4202550afb7526"
 dependencies = [
- "winnow 0.7.12",
+ "winnow 1.0.2",
 ]
 
 [[package]]
 name = "toml_writer"
-version = "1.0.2"
+version = "1.1.1+spec-1.1.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "fcc842091f2def52017664b53082ecbbeb5c7731092bad69d2c63050401dfd64"
+checksum = "756daf9b1013ebe47a8776667b466417e2d4c5679d441c26230efd9ef78692db"
 
 [[package]]
 name = "tower"
-version = "0.4.13"
+version = "0.5.3"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "b8fa9be0de6cf49e536ce1851f987bd21a43b771b09473c3549a6c853db37c1c"
+checksum = "ebe5ef63511595f1344e2d5cfa636d973292adc0eec1f0ad45fae9f0851ab1d4"
 dependencies = [
  "futures-core",
  "futures-util",
- "pin-project",
  "pin-project-lite",
+ "sync_wrapper",
  "tokio",
  "tower-layer",
  "tower-service",
 ]
 
+[[package]]
+name = "tower-http"
+version = "0.6.10"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "68d6fdd9f81c2819c9a8b0e0cd91660e7746a8e6ea2ba7c6b2b057985f6bcb51"
+dependencies = [
+ "bitflags 2.11.1",
+ "bytes",
+ "futures-util",
+ "http",
+ "http-body",
+ "pin-project-lite",
+ "tower",
+ "tower-layer",
+ "tower-service",
+ "url",
+]
+
 [[package]]
 name = "tower-layer"
 version = "0.3.3"
@@ -5080,17 +4784,16 @@ checksum = "121c2a6cda46980bb0fcd1647ffaf6cd3fc79a013de288782836f6df9c48780e"
 
 [[package]]
 name = "tower-service"
-version = "0.3.2"
+version = "0.3.3"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "b6bc1c9ce2b5135ac7f93c72918fc37feb872bdc6a5533a8b85eb4b86bfdae52"
+checksum = "8df9b6e13f2d32c91b9bd719c00d1958837bc7dec474d94952798cc8e69eeec3"
 
 [[package]]
 name = "tracing"
-version = "0.1.37"
+version = "0.1.44"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "8ce8c33a8d48bd45d624a6e523445fd21ec13d3653cd51f681abf67418f54eb8"
+checksum = "63e71662fa4b2a2c3a26f570f037eb95bb1f85397f3cd8076caed2f026a6d100"
 dependencies = [
- "cfg-if",
  "pin-project-lite",
  "tracing-attributes",
  "tracing-core",
@@ -5098,65 +4801,62 @@ dependencies = [
 
 [[package]]
 name = "tracing-attributes"
-version = "0.1.30"
+version = "0.1.31"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "81383ab64e72a7a8b8e13130c49e3dab29def6d0c7d76a03087b3cf71c5c6903"
+checksum = "7490cfa5ec963746568740651ac6781f701c9c5ea257c58e057f3ba8cf69e8da"
 dependencies = [
  "proc-macro2",
  "quote",
- "syn 2.0.106",
+ "syn 2.0.117",
 ]
 
 [[package]]
 name = "tracing-core"
-version = "0.1.30"
+version = "0.1.36"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "24eb03ba0eab1fd845050058ce5e616558e8f8d8fca633e6b163fe25c797213a"
+checksum = "db97caf9d906fbde555dd62fa95ddba9eecfd14cb388e4f491a66d74cd5fb79a"
 dependencies = [
  "once_cell",
 ]
 
 [[package]]
 name = "tray-icon"
-version = "0.21.1"
+version = "0.23.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "a0d92153331e7d02ec09137538996a7786fe679c629c279e82a6be762b7e6fe2"
+checksum = "15edbb0d80583e85ee8df283410038e17314df5cba30da2087a54a85216c0773"
 dependencies = [
  "crossbeam-channel",
  "dirs",
  "libappindicator",
  "muda",
- "objc2 0.6.2",
- "objc2-app-kit 0.3.1",
+ "objc2",
+ "objc2-app-kit",
  "objc2-core-foundation",
  "objc2-core-graphics",
- "objc2-foundation 0.3.1",
+ "objc2-foundation",
  "once_cell",
- "png",
+ "png 0.18.1",
  "serde",
- "thiserror 2.0.15",
- "windows-sys 0.59.0",
+ "thiserror 2.0.18",
+ "windows-sys 0.61.2",
 ]
 
 [[package]]
 name = "tree_magic_mini"
-version = "3.1.5"
+version = "3.2.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "469a727cac55b41448315cc10427c069c618ac59bb6a4480283fcd811749bdc2"
+checksum = "b8765b90061cba6c22b5831f675da109ae5561588290f9fa2317adab2714d5a6"
 dependencies = [
- "fnv",
- "home",
  "memchr",
  "nom",
- "once_cell",
  "petgraph",
 ]
 
 [[package]]
 name = "try-lock"
-version = "0.2.4"
+version = "0.2.5"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "3528ecfd12c466c6f163363caf2d02a71161dd5e1cc6ae7b34207ea2d42d81ed"
+checksum = "e421abadd41a4225275504ea4d6566923418b7f05506fbc9c0fe86ba7396114b"
 
 [[package]]
 name = "typeid"
@@ -5166,25 +4866,19 @@ checksum = "bc7d623258602320d5c55d1bc22793b57daff0ec7efc270ea7d55ce1d5f5471c"
 
 [[package]]
 name = "typenum"
-version = "1.16.0"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "497961ef93d974e23eb6f433eb5fe1b7930b659f06d12dec6fc44a8f554c0bba"
-
-[[package]]
-name = "ucd-trie"
-version = "0.1.5"
+version = "1.20.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "9e79c4d996edb816c91e4308506774452e55e95c3c9de07b6729e17e15a5ef81"
+checksum = "40ce102ab67701b8526c123c1bab5cbe42d7040ccfd0f64af1a385808d2f43de"
 
 [[package]]
 name = "uds_windows"
-version = "1.1.0"
+version = "1.2.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "89daebc3e6fd160ac4aa9fc8b3bf71e1f74fbf92367ae71fb83a037e8bf164b9"
+checksum = "f2f6fb2847f6742cd76af783a2a2c49e9375d0a111c7bef6f71cd9e738c72d6e"
 dependencies = [
- "memoffset 0.9.1",
+ "memoffset",
  "tempfile",
- "winapi",
+ "windows-sys 0.61.2",
 ]
 
 [[package]]
@@ -5228,32 +4922,23 @@ dependencies = [
  "unic-common",
 ]
 
-[[package]]
-name = "unicode-bidi"
-version = "0.3.18"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "5c1cb5db39152898a79168971543b1cb5020dff7fe43c8dc468b0885f5e29df5"
-
 [[package]]
 name = "unicode-ident"
-version = "1.0.5"
+version = "1.0.24"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "6ceab39d59e4c9499d4e5a8ee0e2735b891bb7308ac83dfb4e80cad195c9f6f3"
+checksum = "e6e4313cd5fcd3dad5cafa179702e2b244f760991f45397d14d4ebf38247da75"
 
 [[package]]
-name = "unicode-normalization"
-version = "0.1.24"
+name = "unicode-segmentation"
+version = "1.13.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "5033c97c4262335cded6d6fc3e5c18ab755e1a3dc96376350f3d8e9f009ad956"
-dependencies = [
- "tinyvec",
-]
+checksum = "9629274872b2bfaf8d66f5f15725007f635594914870f65218920345aa11aa8c"
 
 [[package]]
-name = "unicode-segmentation"
-version = "1.12.0"
+name = "unicode-xid"
+version = "0.2.6"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "f6ccf251212114b54433ec949fd6a7841275f9ada20dddd2f29e9ceea4501493"
+checksum = "ebc1c04c71510c7f702b52b7c350734c9ff1295c464a03335b00bb84fc54f853"
 
 [[package]]
 name = "untrusted"
@@ -5263,14 +4948,15 @@ checksum = "8ecb6da28b8a351d773b68d5825ac39017e680750f980f3a1a85cd8dd28a47c1"
 
 [[package]]
 name = "url"
-version = "2.5.4"
+version = "2.5.8"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "32f8b686cadd1473f4bd0117a5d28d36b1ade384ea9b5069a1c40aefed7fda60"
+checksum = "ff67a8a4397373c3ef660812acab3268222035010ab8680ec4215f38ba3d0eed"
 dependencies = [
  "form_urlencoded",
- "idna 1.0.3",
+ "idna",
  "percent-encoding",
  "serde",
+ "serde_derive",
 ]
 
 [[package]]
@@ -5299,25 +4985,27 @@ checksum = "b6c140620e7ffbb22c2dee59cafe6084a59b5ffc27a8859a5f0d494b5d52b6be"
 
 [[package]]
 name = "uuid"
-version = "1.2.2"
+version = "1.23.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "422ee0de9031b5b948b97a8fc04e3aa35230001a722ddd27943e0be31564ce4c"
+checksum = "ddd74a9687298c6858e9b88ec8935ec45d22e8fd5e6394fa1bd4e99a87789c76"
 dependencies = [
- "getrandom 0.2.8",
- "serde",
+ "getrandom 0.4.2",
+ "js-sys",
+ "serde_core",
+ "wasm-bindgen",
 ]
 
 [[package]]
 name = "version-compare"
-version = "0.1.1"
+version = "0.2.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "579a42fc0b8e0c63b76519a339be31bed574929511fa53c1a3acae26eb258f29"
+checksum = "03c2856837ef78f57382f06b2b8563a2f512f7185d732608fd9176cb3b8edf0e"
 
 [[package]]
 name = "version_check"
-version = "0.9.4"
+version = "0.9.5"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "49874b5167b65d7193b8aba1567f5c7d93d001cafc34600cee003eda787e483f"
+checksum = "0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a"
 
 [[package]]
 name = "vswhom"
@@ -5331,9 +5019,9 @@ dependencies = [
 
 [[package]]
 name = "vswhom-sys"
-version = "0.1.2"
+version = "0.1.3"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "d3b17ae1f6c8a2b28506cd96d412eebf83b4a0ff2cbefeeb952f2f9dfa44ba18"
+checksum = "fb067e4cbd1ff067d1df46c9194b5de0e98efd2810bbc95c5d5e5f25a3231150"
 dependencies = [
  "cc",
  "libc",
@@ -5341,12 +5029,11 @@ dependencies = [
 
 [[package]]
 name = "walkdir"
-version = "2.3.2"
+version = "2.5.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "808cf2735cd4b6866113f648b791c6adc5714537bc222d9347bb203386ffda56"
+checksum = "29790946404f91d9c5d06f9874efddea1dc06c5efe94541a7d6863108e3a5e4b"
 dependencies = [
  "same-file",
- "winapi",
  "winapi-util",
 ]
 
@@ -5361,69 +5048,56 @@ dependencies = [
 
 [[package]]
 name = "wasi"
-version = "0.9.0+wasi-snapshot-preview1"
+version = "0.11.1+wasi-snapshot-preview1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "cccddf32554fecc6acb585f82a32a72e28b48f8c4c1883ddfeeeaa96f7d8e519"
+checksum = "ccf3ec651a847eb01de73ccad15eb7d99f80485de043efb2f370cd654f4ea44b"
 
 [[package]]
-name = "wasi"
-version = "0.11.0+wasi-snapshot-preview1"
+name = "wasip2"
+version = "1.0.3+wasi-0.2.9"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
+checksum = "20064672db26d7cdc89c7798c48a0fdfac8213434a1186e5ef29fd560ae223d6"
+dependencies = [
+ "wit-bindgen 0.57.1",
+]
 
 [[package]]
-name = "wasi"
-version = "0.14.2+wasi-0.2.4"
+name = "wasip3"
+version = "0.4.0+wasi-0.3.0-rc-2026-01-06"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "9683f9a5a998d873c0d21fcbe3c083009670149a8fab228644b8bd36b2c48cb3"
+checksum = "5428f8bf88ea5ddc08faddef2ac4a67e390b88186c703ce6dbd955e1c145aca5"
 dependencies = [
- "wit-bindgen-rt",
+ "wit-bindgen 0.51.0",
 ]
 
 [[package]]
 name = "wasm-bindgen"
-version = "0.2.100"
+version = "0.2.121"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "1edc8929d7499fc4e8f0be2262a241556cfc54a0bea223790e71446f2aab1ef5"
+checksum = "49ace1d07c165b0864824eee619580c4689389afa9dc9ed3a4c75040d82e6790"
 dependencies = [
  "cfg-if",
  "once_cell",
  "rustversion",
  "wasm-bindgen-macro",
-]
-
-[[package]]
-name = "wasm-bindgen-backend"
-version = "0.2.100"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "2f0a0651a5c2bc21487bde11ee802ccaf4c51935d0d3d42a6101f98161700bc6"
-dependencies = [
- "bumpalo",
- "log",
- "proc-macro2",
- "quote",
- "syn 2.0.106",
  "wasm-bindgen-shared",
 ]
 
 [[package]]
 name = "wasm-bindgen-futures"
-version = "0.4.50"
+version = "0.4.71"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "555d470ec0bc3bb57890405e5d4322cc9ea83cebb085523ced7be4144dac1e61"
+checksum = "96492d0d3ffba25305a7dc88720d250b1401d7edca02cc3bcd50633b424673b8"
 dependencies = [
- "cfg-if",
  "js-sys",
- "once_cell",
  "wasm-bindgen",
- "web-sys",
 ]
 
 [[package]]
 name = "wasm-bindgen-macro"
-version = "0.2.100"
+version = "0.2.121"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "7fe63fc6d09ed3792bd0897b314f53de8e16568c2b3f7982f468c0bf9bd0b407"
+checksum = "8e68e6f4afd367a562002c05637acb8578ff2dea1943df76afb9e83d177c8578"
 dependencies = [
  "quote",
  "wasm-bindgen-macro-support",
@@ -5431,173 +5105,180 @@ dependencies = [
 
 [[package]]
 name = "wasm-bindgen-macro-support"
-version = "0.2.100"
+version = "0.2.121"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "8ae87ea40c9f689fc23f209965b6fb8a99ad69aeeb0231408be24920604395de"
+checksum = "d95a9ec35c64b2a7cb35d3fead40c4238d0940c86d107136999567a4703259f2"
 dependencies = [
+ "bumpalo",
  "proc-macro2",
  "quote",
- "syn 2.0.106",
- "wasm-bindgen-backend",
+ "syn 2.0.117",
  "wasm-bindgen-shared",
 ]
 
 [[package]]
 name = "wasm-bindgen-shared"
-version = "0.2.100"
+version = "0.2.121"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "1a05d73b933a847d6cccdda8f838a22ff101ad9bf93e33684f39c1f5f0eece3d"
+checksum = "c4e0100b01e9f0d03189a92b96772a1fb998639d981193d7dbab487302513441"
 dependencies = [
  "unicode-ident",
 ]
 
 [[package]]
-name = "wasm-streams"
-version = "0.4.2"
+name = "wasm-encoder"
+version = "0.244.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "15053d8d85c7eccdbefef60f06769760a563c7f0a9d6902a13d35c7800b0ad65"
+checksum = "990065f2fe63003fe337b932cfb5e3b80e0b4d0f5ff650e6985b1048f62c8319"
 dependencies = [
- "futures-util",
- "js-sys",
- "wasm-bindgen",
- "wasm-bindgen-futures",
- "web-sys",
+ "leb128fmt",
+ "wasmparser",
 ]
 
 [[package]]
-name = "wayland-backend"
-version = "0.3.11"
+name = "wasm-metadata"
+version = "0.244.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "673a33c33048a5ade91a6b139580fa174e19fb0d23f396dca9fa15f2e1e49b35"
+checksum = "bb0e353e6a2fbdc176932bbaab493762eb1255a7900fe0fea1a2f96c296cc909"
 dependencies = [
- "cc",
- "downcast-rs",
- "rustix 1.0.8",
- "scoped-tls",
- "smallvec",
- "wayland-sys 0.31.7",
+ "anyhow",
+ "indexmap 2.14.0",
+ "wasm-encoder",
+ "wasmparser",
 ]
 
 [[package]]
-name = "wayland-client"
-version = "0.29.5"
+name = "wasm-streams"
+version = "0.5.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "3f3b068c05a039c9f755f881dc50f01732214f5685e379829759088967c46715"
+checksum = "9d1ec4f6517c9e11ae630e200b2b65d193279042e28edd4a2cda233e46670bbb"
 dependencies = [
- "bitflags 1.3.2",
- "downcast-rs",
- "libc",
- "nix 0.24.3",
- "wayland-commons",
- "wayland-scanner 0.29.5",
- "wayland-sys 0.29.5",
+ "futures-util",
+ "js-sys",
+ "wasm-bindgen",
+ "wasm-bindgen-futures",
+ "web-sys",
 ]
 
 [[package]]
-name = "wayland-client"
-version = "0.31.11"
+name = "wasmparser"
+version = "0.244.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "c66a47e840dc20793f2264eb4b3e4ecb4b75d91c0dd4af04b456128e0bdd449d"
+checksum = "47b807c72e1bac69382b3a6fb3dbe8ea4c0ed87ff5629b8685ae6b9a611028fe"
 dependencies = [
- "bitflags 2.8.0",
- "rustix 1.0.8",
- "wayland-backend",
- "wayland-scanner 0.31.7",
+ "bitflags 2.11.1",
+ "hashbrown 0.15.5",
+ "indexmap 2.14.0",
+ "semver",
 ]
 
 [[package]]
-name = "wayland-commons"
-version = "0.29.5"
+name = "wayland-backend"
+version = "0.3.15"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "8691f134d584a33a6606d9d717b95c4fa20065605f798a3f350d78dced02a902"
+checksum = "2857dd20b54e916ec7253b3d6b4d5c4d7d4ca2c33c2e11c6c76a99bd8744755d"
 dependencies = [
- "nix 0.24.3",
- "once_cell",
+ "cc",
+ "downcast-rs",
+ "rustix",
  "smallvec",
- "wayland-sys 0.29.5",
+ "wayland-sys",
 ]
 
 [[package]]
-name = "wayland-protocols"
-version = "0.29.5"
+name = "wayland-client"
+version = "0.31.14"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "b950621f9354b322ee817a23474e479b34be96c2e909c14f7bc0100e9a970bc6"
+checksum = "645c7c96bb74690c3189b5c9cb4ca1627062bb23693a4fad9d8c3de958260144"
 dependencies = [
- "bitflags 1.3.2",
- "wayland-client 0.29.5",
- "wayland-commons",
- "wayland-scanner 0.29.5",
+ "bitflags 2.11.1",
+ "rustix",
+ "wayland-backend",
+ "wayland-scanner",
 ]
 
 [[package]]
 name = "wayland-protocols"
-version = "0.32.9"
+version = "0.32.12"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "efa790ed75fbfd71283bd2521a1cfdc022aabcc28bdcff00851f9e4ae88d9901"
+checksum = "563a85523cade2429938e790815fd7319062103b9f4a2dc806e9b53b95982d8f"
 dependencies = [
- "bitflags 2.8.0",
+ "bitflags 2.11.1",
  "wayland-backend",
- "wayland-client 0.31.11",
- "wayland-scanner 0.31.7",
+ "wayland-client",
+ "wayland-scanner",
 ]
 
 [[package]]
-name = "wayland-scanner"
-version = "0.29.5"
+name = "wayland-protocols-wlr"
+version = "0.3.12"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "8f4303d8fa22ab852f789e75a967f0a2cdc430a607751c0499bada3e451cbd53"
+checksum = "eb04e52f7836d7c7976c78ca0250d61e33873c34156a2a1fc9474828ec268234"
 dependencies = [
- "proc-macro2",
- "quote",
- "xml-rs",
+ "bitflags 2.11.1",
+ "wayland-backend",
+ "wayland-client",
+ "wayland-protocols",
+ "wayland-scanner",
 ]
 
 [[package]]
 name = "wayland-scanner"
-version = "0.31.7"
+version = "0.31.10"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "54cb1e9dc49da91950bdfd8b848c49330536d9d1fb03d4bfec8cae50caa50ae3"
+checksum = "9c324a910fd86ebdc364a3e61ec1f11737d3b1d6c273c0239ee8ff4bc0d24b4a"
 dependencies = [
  "proc-macro2",
- "quick-xml 0.37.5",
+ "quick-xml 0.39.4",
  "quote",
 ]
 
 [[package]]
 name = "wayland-sys"
-version = "0.29.5"
+version = "0.31.11"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "be12ce1a3c39ec7dba25594b97b42cb3195d54953ddb9d3d95a7c3902bc6e9d4"
+checksum = "d8eab23fefc9e41f8e841df4a9c707e8a8c4ed26e944ef69297184de2785e3be"
 dependencies = [
  "pkg-config",
 ]
 
 [[package]]
-name = "wayland-sys"
-version = "0.31.7"
+name = "web-sys"
+version = "0.3.98"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "34949b42822155826b41db8e5d0c1be3a2bd296c747577a43a3e6daefc296142"
+checksum = "4b572dff8bcf38bad0fa19729c89bb5748b2b9b1d8be70cf90df697e3a8f32aa"
 dependencies = [
- "dlib",
- "log",
- "pkg-config",
+ "js-sys",
+ "wasm-bindgen",
 ]
 
 [[package]]
-name = "web-sys"
-version = "0.3.77"
+name = "web-time"
+version = "1.1.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "33b6dd2ef9186f1f2072e409e99cd22a975331a6b3591b12c764e0e55c60d5d2"
+checksum = "5a6580f308b1fad9207618087a65c04e7a10bc77e02c8e84e9b00dd4b12fa0bb"
 dependencies = [
  "js-sys",
  "wasm-bindgen",
 ]
 
+[[package]]
+name = "web_atoms"
+version = "0.2.4"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "d7cff6eef815df1834fd250e3a2ff436044d82a9f1bc1980ca1dbdf07effc538"
+dependencies = [
+ "phf",
+ "phf_codegen",
+ "string_cache",
+ "string_cache_codegen",
+]
+
 [[package]]
 name = "webkit2gtk"
-version = "2.0.1"
+version = "2.0.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "76b1bc1e54c581da1e9f179d0b38512ba358fb1af2d634a1affe42e37172361a"
+checksum = "a1027150013530fb2eaf806408df88461ae4815a45c541c8975e61d6f2fc4793"
 dependencies = [
  "bitflags 1.3.2",
  "cairo-rs",
@@ -5619,9 +5300,9 @@ dependencies = [
 
 [[package]]
 name = "webkit2gtk-sys"
-version = "2.0.1"
+version = "2.0.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "62daa38afc514d1f8f12b8693d30d5993ff77ced33ce30cd04deebc267a6d57c"
+checksum = "916a5f65c2ef0dfe12fff695960a2ec3d4565359fdbb2e9943c974e06c734ea5"
 dependencies = [
  "bitflags 1.3.2",
  "cairo-sys-rs",
@@ -5639,63 +5320,54 @@ dependencies = [
 
 [[package]]
 name = "webpki-roots"
-version = "0.26.11"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "521bc38abb08001b01866da9f51eb7c5d647a19260e00054a8c7fd5f9e57f7a9"
-dependencies = [
- "webpki-roots 1.0.2",
-]
-
-[[package]]
-name = "webpki-roots"
-version = "1.0.2"
+version = "1.0.7"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "7e8983c3ab33d6fb807cfcdad2491c4ea8cbc8ed839181c7dfd9c67c83e261b2"
+checksum = "52f5ee44c96cf55f1b349600768e3ece3a8f26010c05265ab73f945bb1a2eb9d"
 dependencies = [
  "rustls-pki-types",
 ]
 
 [[package]]
 name = "webview2-com"
-version = "0.38.0"
+version = "0.38.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "d4ba622a989277ef3886dd5afb3e280e3dd6d974b766118950a08f8f678ad6a4"
+checksum = "7130243a7a5b33c54a444e54842e6a9e133de08b5ad7b5861cd8ed9a6a5bc96a"
 dependencies = [
  "webview2-com-macros",
  "webview2-com-sys",
- "windows 0.61.3",
+ "windows",
  "windows-core 0.61.2",
- "windows-implement 0.60.0",
- "windows-interface 0.59.1",
+ "windows-implement",
+ "windows-interface",
 ]
 
 [[package]]
 name = "webview2-com-macros"
-version = "0.8.0"
+version = "0.8.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "1d228f15bba3b9d56dde8bddbee66fa24545bd17b48d5128ccf4a8742b18e431"
+checksum = "67a921c1b6914c367b2b823cd4cde6f96beec77d30a939c8199bb377cf9b9b54"
 dependencies = [
  "proc-macro2",
  "quote",
- "syn 2.0.106",
+ "syn 2.0.117",
 ]
 
 [[package]]
 name = "webview2-com-sys"
-version = "0.38.0"
+version = "0.38.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "36695906a1b53a3bf5c4289621efedac12b73eeb0b89e7e1a89b517302d5d75c"
+checksum = "381336cfffd772377d291702245447a5251a2ffa5bad679c99e61bc48bacbf9c"
 dependencies = [
- "thiserror 2.0.15",
- "windows 0.61.3",
+ "thiserror 2.0.18",
+ "windows",
  "windows-core 0.61.2",
 ]
 
 [[package]]
 name = "weezl"
-version = "0.1.8"
+version = "0.1.12"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "53a85b86a771b1c87058196170769dd264f66c0782acf1ae6cc51bfd64b39082"
+checksum = "a28ac98ddc8b9274cb41bb4d9d4d5c425b6020c50c46f25559911905610b4a88"
 
 [[package]]
 name = "winapi"
@@ -5710,25 +5382,16 @@ dependencies = [
 [[package]]
 name = "winapi-i686-pc-windows-gnu"
 version = "0.4.0"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
-
-[[package]]
-name = "winapi-util"
-version = "0.1.5"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "70ec6ce85bb158151cae5e5c87f95a8e97d2c0c4b001223f33a334e3ce5de178"
-dependencies = [
- "winapi",
-]
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
 
 [[package]]
-name = "winapi-wsapoll"
-version = "0.1.2"
+name = "winapi-util"
+version = "0.1.11"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "1eafc5f679c576995526e81635d0cf9695841736712b4e892f87abbe6fed3f28"
+checksum = "c2a7b1c03c876122aa43f3020e6c3c3ee5c05081c9a00739faf7503aeba10d22"
 dependencies = [
- "winapi",
+ "windows-sys 0.61.2",
 ]
 
 [[package]]
@@ -5743,25 +5406,15 @@ version = "0.6.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
 checksum = "d9bec5a31f3f9362f2258fd0e9c9dd61a9ca432e7306cc78c444258f0dce9a9c"
 dependencies = [
- "objc2 0.6.2",
- "objc2-app-kit 0.3.1",
+ "objc2",
+ "objc2-app-kit",
  "objc2-core-foundation",
- "objc2-foundation 0.3.1",
+ "objc2-foundation",
  "raw-window-handle",
  "windows-sys 0.59.0",
  "windows-version",
 ]
 
-[[package]]
-name = "windows"
-version = "0.56.0"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "1de69df01bdf1ead2f4ac895dc77c9351aefff65b2f3db429a343f9cbf05e132"
-dependencies = [
- "windows-core 0.56.0",
- "windows-targets 0.52.6",
-]
-
 [[package]]
 name = "windows"
 version = "0.61.3"
@@ -5771,7 +5424,7 @@ dependencies = [
  "windows-collections",
  "windows-core 0.61.2",
  "windows-future",
- "windows-link",
+ "windows-link 0.1.3",
  "windows-numerics",
 ]
 
@@ -5786,36 +5439,28 @@ dependencies = [
 
 [[package]]
 name = "windows-core"
-version = "0.51.1"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "f1f8cf84f35d2db49a46868f947758c7a1138116f7fac3bc844f43ade1292e64"
-dependencies = [
- "windows-targets 0.48.5",
-]
-
-[[package]]
-name = "windows-core"
-version = "0.56.0"
+version = "0.61.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "4698e52ed2d08f8658ab0c39512a7c00ee5fe2688c65f8c0a4f06750d729f2a6"
+checksum = "c0fdd3ddb90610c7638aa2b3a3ab2904fb9e5cdbecc643ddb3647212781c4ae3"
 dependencies = [
- "windows-implement 0.56.0",
- "windows-interface 0.56.0",
- "windows-result 0.1.2",
- "windows-targets 0.52.6",
+ "windows-implement",
+ "windows-interface",
+ "windows-link 0.1.3",
+ "windows-result 0.3.4",
+ "windows-strings 0.4.2",
 ]
 
 [[package]]
 name = "windows-core"
-version = "0.61.2"
+version = "0.62.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "c0fdd3ddb90610c7638aa2b3a3ab2904fb9e5cdbecc643ddb3647212781c4ae3"
+checksum = "b8e83a14d34d0623b51dce9581199302a221863196a1dde71a7663a4c2be9deb"
 dependencies = [
- "windows-implement 0.60.0",
- "windows-interface 0.59.1",
- "windows-link",
- "windows-result 0.3.4",
- "windows-strings",
+ "windows-implement",
+ "windows-interface",
+ "windows-link 0.2.1",
+ "windows-result 0.4.1",
+ "windows-strings 0.5.1",
 ]
 
 [[package]]
@@ -5825,59 +5470,43 @@ source = "registry+https://github.com/rust-lang/crates.io-index"
 checksum = "fc6a41e98427b19fe4b73c550f060b59fa592d7d686537eebf9385621bfbad8e"
 dependencies = [
  "windows-core 0.61.2",
- "windows-link",
+ "windows-link 0.1.3",
  "windows-threading",
 ]
 
 [[package]]
 name = "windows-implement"
-version = "0.56.0"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "f6fc35f58ecd95a9b71c4f2329b911016e6bec66b3f2e6a4aad86bd2e99e2f9b"
-dependencies = [
- "proc-macro2",
- "quote",
- "syn 2.0.106",
-]
-
-[[package]]
-name = "windows-implement"
-version = "0.60.0"
+version = "0.60.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "a47fddd13af08290e67f4acabf4b459f647552718f683a7b415d290ac744a836"
+checksum = "053e2e040ab57b9dc951b72c264860db7eb3b0200ba345b4e4c3b14f67855ddf"
 dependencies = [
  "proc-macro2",
  "quote",
- "syn 2.0.106",
+ "syn 2.0.117",
 ]
 
 [[package]]
 name = "windows-interface"
-version = "0.56.0"
+version = "0.59.3"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "08990546bf4edef8f431fa6326e032865f27138718c587dc21bc0265bbcb57cc"
+checksum = "3f316c4a2570ba26bbec722032c4099d8c8bc095efccdc15688708623367e358"
 dependencies = [
  "proc-macro2",
  "quote",
- "syn 2.0.106",
+ "syn 2.0.117",
 ]
 
 [[package]]
-name = "windows-interface"
-version = "0.59.1"
+name = "windows-link"
+version = "0.1.3"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "bd9211b69f8dcdfa817bfd14bf1c97c9188afa36f4750130fcdf3f400eca9fa8"
-dependencies = [
- "proc-macro2",
- "quote",
- "syn 2.0.106",
-]
+checksum = "5e6ad25900d524eaabdbbb96d20b4311e1e7ae1699af4fb28c17ae66c80d798a"
 
 [[package]]
 name = "windows-link"
-version = "0.1.3"
+version = "0.2.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "5e6ad25900d524eaabdbbb96d20b4311e1e7ae1699af4fb28c17ae66c80d798a"
+checksum = "f0805222e57f7521d6a62e36fa9163bc891acd422f971defe97d64e70d0a4fe5"
 
 [[package]]
 name = "windows-numerics"
@@ -5886,16 +5515,18 @@ source = "registry+https://github.com/rust-lang/crates.io-index"
 checksum = "9150af68066c4c5c07ddc0ce30421554771e528bde427614c61038bc2c92c2b1"
 dependencies = [
  "windows-core 0.61.2",
- "windows-link",
+ "windows-link 0.1.3",
 ]
 
 [[package]]
-name = "windows-result"
-version = "0.1.2"
+name = "windows-registry"
+version = "0.6.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "5e383302e8ec8515204254685643de10811af0ed97ea37210dc26fb0032647f8"
+checksum = "02752bf7fbdcce7f2a27a742f798510f3e5ad88dbe84871e5168e2120c3d5720"
 dependencies = [
- "windows-targets 0.52.6",
+ "windows-link 0.2.1",
+ "windows-result 0.4.1",
+ "windows-strings 0.5.1",
 ]
 
 [[package]]
@@ -5904,7 +5535,16 @@ version = "0.3.4"
 source = "registry+https://github.com/rust-lang/crates.io-index"
 checksum = "56f42bd332cc6c8eac5af113fc0c1fd6a8fd2aa08a0119358686e5160d0586c6"
 dependencies = [
- "windows-link",
+ "windows-link 0.1.3",
+]
+
+[[package]]
+name = "windows-result"
+version = "0.4.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "7781fa89eaf60850ac3d2da7af8e5242a5ea78d1a11c49bf2910bb5a73853eb5"
+dependencies = [
+ "windows-link 0.2.1",
 ]
 
 [[package]]
@@ -5913,22 +5553,16 @@ version = "0.4.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
 checksum = "56e6c93f3a0c3b36176cb1327a4958a0353d5d166c2a35cb268ace15e91d3b57"
 dependencies = [
- "windows-link",
+ "windows-link 0.1.3",
 ]
 
 [[package]]
-name = "windows-sys"
-version = "0.42.0"
+name = "windows-strings"
+version = "0.5.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "5a3e1820f08b8513f676f7ab6c1f99ff312fb97b553d30ff4dd86f9f15728aa7"
+checksum = "7837d08f69c77cf6b07689544538e017c1bfcf57e34b4c0ff58e6c2cd3b37091"
 dependencies = [
- "windows_aarch64_gnullvm 0.42.2",
- "windows_aarch64_msvc 0.42.2",
- "windows_i686_gnu 0.42.2",
- "windows_i686_msvc 0.42.2",
- "windows_x86_64_gnu 0.42.2",
- "windows_x86_64_gnullvm 0.42.2",
- "windows_x86_64_msvc 0.42.2",
+ "windows-link 0.2.1",
 ]
 
 [[package]]
@@ -5940,15 +5574,6 @@ dependencies = [
  "windows-targets 0.42.2",
 ]
 
-[[package]]
-name = "windows-sys"
-version = "0.48.0"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "677d2418bec65e3338edb076e806bc1ec15693c5d0104683f2efe857f61056a9"
-dependencies = [
- "windows-targets 0.48.5",
-]
-
 [[package]]
 name = "windows-sys"
 version = "0.52.0"
@@ -5973,7 +5598,16 @@ version = "0.60.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
 checksum = "f2f500e4d28234f72040990ec9d39e3a6b950f9f22d3dba18416c35882612bcb"
 dependencies = [
- "windows-targets 0.53.3",
+ "windows-targets 0.53.5",
+]
+
+[[package]]
+name = "windows-sys"
+version = "0.61.2"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "ae137229bcbd6cdf0f7b80a31df61766145077ddf49416a728b02cb3921ff3fc"
+dependencies = [
+ "windows-link 0.2.1",
 ]
 
 [[package]]
@@ -5991,21 +5625,6 @@ dependencies = [
  "windows_x86_64_msvc 0.42.2",
 ]
 
-[[package]]
-name = "windows-targets"
-version = "0.48.5"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "9a2fa6e2155d7247be68c096456083145c183cbbbc2764150dda45a87197940c"
-dependencies = [
- "windows_aarch64_gnullvm 0.48.5",
- "windows_aarch64_msvc 0.48.5",
- "windows_i686_gnu 0.48.5",
- "windows_i686_msvc 0.48.5",
- "windows_x86_64_gnu 0.48.5",
- "windows_x86_64_gnullvm 0.48.5",
- "windows_x86_64_msvc 0.48.5",
-]
-
 [[package]]
 name = "windows-targets"
 version = "0.52.6"
@@ -6024,19 +5643,19 @@ dependencies = [
 
 [[package]]
 name = "windows-targets"
-version = "0.53.3"
+version = "0.53.5"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "d5fe6031c4041849d7c496a8ded650796e7b6ecc19df1a431c1a363342e5dc91"
+checksum = "4945f9f551b88e0d65f3db0bc25c33b8acea4d9e41163edf90dcd0b19f9069f3"
 dependencies = [
- "windows-link",
- "windows_aarch64_gnullvm 0.53.0",
- "windows_aarch64_msvc 0.53.0",
- "windows_i686_gnu 0.53.0",
- "windows_i686_gnullvm 0.53.0",
- "windows_i686_msvc 0.53.0",
- "windows_x86_64_gnu 0.53.0",
- "windows_x86_64_gnullvm 0.53.0",
- "windows_x86_64_msvc 0.53.0",
+ "windows-link 0.2.1",
+ "windows_aarch64_gnullvm 0.53.1",
+ "windows_aarch64_msvc 0.53.1",
+ "windows_i686_gnu 0.53.1",
+ "windows_i686_gnullvm 0.53.1",
+ "windows_i686_msvc 0.53.1",
+ "windows_x86_64_gnu 0.53.1",
+ "windows_x86_64_gnullvm 0.53.1",
+ "windows_x86_64_msvc 0.53.1",
 ]
 
 [[package]]
@@ -6045,16 +5664,16 @@ version = "0.1.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
 checksum = "b66463ad2e0ea3bbf808b7f1d371311c80e115c0b71d60efc142cafbcfb057a6"
 dependencies = [
- "windows-link",
+ "windows-link 0.1.3",
 ]
 
 [[package]]
 name = "windows-version"
-version = "0.1.1"
+version = "0.1.7"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "6998aa457c9ba8ff2fb9f13e9d2a930dabcea28f1d0ab94d687d8b3654844515"
+checksum = "e4060a1da109b9d0326b7262c8e12c84df67cc0dbc9e33cf49e01ccc2eb63631"
 dependencies = [
- "windows-targets 0.52.6",
+ "windows-link 0.2.1",
 ]
 
 [[package]]
@@ -6063,12 +5682,6 @@ version = "0.42.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
 checksum = "597a5118570b68bc08d8d59125332c54f1ba9d9adeedeef5b99b02ba2b0698f8"
 
-[[package]]
-name = "windows_aarch64_gnullvm"
-version = "0.48.5"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "2b38e32f0abccf9987a4e3079dfb67dcd799fb61361e53e2882c3cbaf0d905d8"
-
 [[package]]
 name = "windows_aarch64_gnullvm"
 version = "0.52.6"
@@ -6077,9 +5690,9 @@ checksum = "32a4622180e7a0ec044bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3"
 
 [[package]]
 name = "windows_aarch64_gnullvm"
-version = "0.53.0"
+version = "0.53.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "86b8d5f90ddd19cb4a147a5fa63ca848db3df085e25fee3cc10b39b6eebae764"
+checksum = "a9d8416fa8b42f5c947f8482c43e7d89e73a173cead56d044f6a56104a6d1b53"
 
 [[package]]
 name = "windows_aarch64_msvc"
@@ -6087,12 +5700,6 @@ version = "0.42.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
 checksum = "e08e8864a60f06ef0d0ff4ba04124db8b0fb3be5776a5cd47641e942e58c4d43"
 
-[[package]]
-name = "windows_aarch64_msvc"
-version = "0.48.5"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "dc35310971f3b2dbbf3f0690a219f40e2d9afcf64f9ab7cc1be722937c26b4bc"
-
 [[package]]
 name = "windows_aarch64_msvc"
 version = "0.52.6"
@@ -6101,9 +5708,9 @@ checksum = "09ec2a7bb152e2252b53fa7803150007879548bc709c039df7627cabbd05d469"
 
 [[package]]
 name = "windows_aarch64_msvc"
-version = "0.53.0"
+version = "0.53.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "c7651a1f62a11b8cbd5e0d42526e55f2c99886c77e007179efff86c2b137e66c"
+checksum = "b9d782e804c2f632e395708e99a94275910eb9100b2114651e04744e9b125006"
 
 [[package]]
 name = "windows_i686_gnu"
@@ -6111,12 +5718,6 @@ version = "0.42.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
 checksum = "c61d927d8da41da96a81f029489353e68739737d3beca43145c8afec9a31a84f"
 
-[[package]]
-name = "windows_i686_gnu"
-version = "0.48.5"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "a75915e7def60c94dcef72200b9a8e58e5091744960da64ec734a6c6e9b3743e"
-
 [[package]]
 name = "windows_i686_gnu"
 version = "0.52.6"
@@ -6125,9 +5726,9 @@ checksum = "8e9b5ad5ab802e97eb8e295ac6720e509ee4c243f69d781394014ebfe8bbfa0b"
 
 [[package]]
 name = "windows_i686_gnu"
-version = "0.53.0"
+version = "0.53.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "c1dc67659d35f387f5f6c479dc4e28f1d4bb90ddd1a5d3da2e5d97b42d6272c3"
+checksum = "960e6da069d81e09becb0ca57a65220ddff016ff2d6af6a223cf372a506593a3"
 
 [[package]]
 name = "windows_i686_gnullvm"
@@ -6137,9 +5738,9 @@ checksum = "0eee52d38c090b3caa76c563b86c3a4bd71ef1a819287c19d586d7334ae8ed66"
 
 [[package]]
 name = "windows_i686_gnullvm"
-version = "0.53.0"
+version = "0.53.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "9ce6ccbdedbf6d6354471319e781c0dfef054c81fbc7cf83f338a4296c0cae11"
+checksum = "fa7359d10048f68ab8b09fa71c3daccfb0e9b559aed648a8f95469c27057180c"
 
 [[package]]
 name = "windows_i686_msvc"
@@ -6147,12 +5748,6 @@ version = "0.42.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
 checksum = "44d840b6ec649f480a41c8d80f9c65108b92d89345dd94027bfe06ac444d1060"
 
-[[package]]
-name = "windows_i686_msvc"
-version = "0.48.5"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "8f55c233f70c4b27f66c523580f78f1004e8b5a8b659e05a4eb49d4166cca406"
-
 [[package]]
 name = "windows_i686_msvc"
 version = "0.52.6"
@@ -6161,9 +5756,9 @@ checksum = "240948bc05c5e7c6dabba28bf89d89ffce3e303022809e73deaefe4f6ec56c66"
 
 [[package]]
 name = "windows_i686_msvc"
-version = "0.53.0"
+version = "0.53.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "581fee95406bb13382d2f65cd4a908ca7b1e4c2f1917f143ba16efe98a589b5d"
+checksum = "1e7ac75179f18232fe9c285163565a57ef8d3c89254a30685b57d83a38d326c2"
 
 [[package]]
 name = "windows_x86_64_gnu"
@@ -6171,12 +5766,6 @@ version = "0.42.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
 checksum = "8de912b8b8feb55c064867cf047dda097f92d51efad5b491dfb98f6bbb70cb36"
 
-[[package]]
-name = "windows_x86_64_gnu"
-version = "0.48.5"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "53d40abd2583d23e4718fddf1ebec84dbff8381c07cae67ff7768bbf19c6718e"
-
 [[package]]
 name = "windows_x86_64_gnu"
 version = "0.52.6"
@@ -6185,9 +5774,9 @@ checksum = "147a5c80aabfbf0c7d901cb5895d1de30ef2907eb21fbbab29ca94c5b08b1a78"
 
 [[package]]
 name = "windows_x86_64_gnu"
-version = "0.53.0"
+version = "0.53.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "2e55b5ac9ea33f2fc1716d1742db15574fd6fc8dadc51caab1c16a3d3b4190ba"
+checksum = "9c3842cdd74a865a8066ab39c8a7a473c0778a3f29370b5fd6b4b9aa7df4a499"
 
 [[package]]
 name = "windows_x86_64_gnullvm"
@@ -6195,12 +5784,6 @@ version = "0.42.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
 checksum = "26d41b46a36d453748aedef1486d5c7a85db22e56aff34643984ea85514e94a3"
 
-[[package]]
-name = "windows_x86_64_gnullvm"
-version = "0.48.5"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "0b7b52767868a23d5bab768e390dc5f5c55825b6d30b86c844ff2dc7414044cc"
-
 [[package]]
 name = "windows_x86_64_gnullvm"
 version = "0.52.6"
@@ -6209,9 +5792,9 @@ checksum = "24d5b23dc417412679681396f2b49f3de8c1473deb516bd34410872eff51ed0d"
 
 [[package]]
 name = "windows_x86_64_gnullvm"
-version = "0.53.0"
+version = "0.53.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "0a6e035dd0599267ce1ee132e51c27dd29437f63325753051e71dd9e42406c57"
+checksum = "0ffa179e2d07eee8ad8f57493436566c7cc30ac536a3379fdf008f47f6bb7ae1"
 
 [[package]]
 name = "windows_x86_64_msvc"
@@ -6219,12 +5802,6 @@ version = "0.42.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
 checksum = "9aec5da331524158c6d1a4ac0ab1541149c0b9505fde06423b02f5ef0106b9f0"
 
-[[package]]
-name = "windows_x86_64_msvc"
-version = "0.48.5"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "ed94fce61571a4006852b7389a063ab983c02eb1bb37b47f8272ce92d06d9538"
-
 [[package]]
 name = "windows_x86_64_msvc"
 version = "0.52.6"
@@ -6233,33 +5810,32 @@ checksum = "589f6da84c646204747d1270a2a5661ea66ed1cced2631d546fdfb155959f9ec"
 
 [[package]]
 name = "windows_x86_64_msvc"
-version = "0.53.0"
+version = "0.53.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "271414315aff87387382ec3d271b52d7ae78726f5d44ac98b4f4030c91880486"
+checksum = "d6bbff5f0aada427a1e5a6da5f1f98158182f26556f345ac9e04d36d0ebed650"
 
 [[package]]
 name = "winnow"
-version = "0.5.17"
+version = "0.5.40"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "a3b801d0e0a6726477cc207f60162da452f3a95adb368399bef20a946e06f65c"
+checksum = "f593a95398737aeed53e489c785df13f3618e41dbcd6718c6addbf1395aa6876"
 dependencies = [
  "memchr",
 ]
 
 [[package]]
 name = "winnow"
-version = "0.7.12"
+version = "0.7.15"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "f3edebf492c8125044983378ecb5766203ad3b4c2f7a922bd7dd207f6d443e95"
+checksum = "df79d97927682d2fd8adb29682d1140b343be4ac0f08fd68b7765d9c059d3945"
 
 [[package]]
-name = "winreg"
-version = "0.52.0"
+name = "winnow"
+version = "1.0.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "a277a57398d4bfa075df44f501a17cfdf8542d224f0d36095a2adc7aee4ef0a5"
+checksum = "2ee1708bef14716a11bae175f579062d4554d95be2c6829f518df847b7b3fdd0"
 dependencies = [
- "cfg-if",
- "windows-sys 0.48.0",
+ "memchr",
 ]
 
 [[package]]
@@ -6273,63 +5849,148 @@ dependencies = [
 ]
 
 [[package]]
-name = "wit-bindgen-rt"
-version = "0.39.0"
+name = "wit-bindgen"
+version = "0.51.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "d7249219f66ced02969388cf2bb044a09756a083d0fab1e566056b04d9fbcaa5"
+dependencies = [
+ "wit-bindgen-rust-macro",
+]
+
+[[package]]
+name = "wit-bindgen"
+version = "0.57.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "6f42320e61fe2cfd34354ecb597f86f413484a798ba44a8ca1165c58d42da6c1"
+checksum = "1ebf944e87a7c253233ad6766e082e3cd714b5d03812acc24c318f549614536e"
+
+[[package]]
+name = "wit-bindgen-core"
+version = "0.51.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "ea61de684c3ea68cb082b7a88508a8b27fcc8b797d738bfc99a82facf1d752dc"
+dependencies = [
+ "anyhow",
+ "heck 0.5.0",
+ "wit-parser",
+]
+
+[[package]]
+name = "wit-bindgen-rust"
+version = "0.51.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "b7c566e0f4b284dd6561c786d9cb0142da491f46a9fbed79ea69cdad5db17f21"
+dependencies = [
+ "anyhow",
+ "heck 0.5.0",
+ "indexmap 2.14.0",
+ "prettyplease",
+ "syn 2.0.117",
+ "wasm-metadata",
+ "wit-bindgen-core",
+ "wit-component",
+]
+
+[[package]]
+name = "wit-bindgen-rust-macro"
+version = "0.51.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "0c0f9bfd77e6a48eccf51359e3ae77140a7f50b1e2ebfe62422d8afdaffab17a"
+dependencies = [
+ "anyhow",
+ "prettyplease",
+ "proc-macro2",
+ "quote",
+ "syn 2.0.117",
+ "wit-bindgen-core",
+ "wit-bindgen-rust",
+]
+
+[[package]]
+name = "wit-component"
+version = "0.244.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "9d66ea20e9553b30172b5e831994e35fbde2d165325bec84fc43dbf6f4eb9cb2"
+dependencies = [
+ "anyhow",
+ "bitflags 2.11.1",
+ "indexmap 2.14.0",
+ "log",
+ "serde",
+ "serde_derive",
+ "serde_json",
+ "wasm-encoder",
+ "wasm-metadata",
+ "wasmparser",
+ "wit-parser",
+]
+
+[[package]]
+name = "wit-parser"
+version = "0.244.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "ecc8ac4bc1dc3381b7f59c34f00b67e18f910c2c0f50015669dde7def656a736"
 dependencies = [
- "bitflags 2.8.0",
+ "anyhow",
+ "id-arena",
+ "indexmap 2.14.0",
+ "log",
+ "semver",
+ "serde",
+ "serde_derive",
+ "serde_json",
+ "unicode-xid",
+ "wasmparser",
 ]
 
 [[package]]
 name = "wl-clipboard-rs"
-version = "0.7.0"
+version = "0.9.3"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "981a303dfbb75d659f6612d05a14b2e363c103d24f676a2d44a00d18507a1ad9"
+checksum = "e9651471a32e87d96ef3a127715382b2d11cc7c8bb9822ded8a7cc94072eb0a3"
 dependencies = [
- "derive-new",
  "libc",
  "log",
- "nix 0.24.3",
  "os_pipe",
- "tempfile",
- "thiserror 1.0.50",
+ "rustix",
+ "thiserror 2.0.18",
  "tree_magic_mini",
- "wayland-client 0.29.5",
- "wayland-protocols 0.29.5",
+ "wayland-backend",
+ "wayland-client",
+ "wayland-protocols",
+ "wayland-protocols-wlr",
 ]
 
 [[package]]
 name = "writeable"
-version = "0.6.1"
+version = "0.6.3"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "ea2f10b9bb0928dfb1b42b65e1f9e36f7f54dbdf08457afefb38afcdec4fa2bb"
+checksum = "1ffae5123b2d3fc086436f8834ae3ab053a283cfac8fe0a0b8eaae044768a4c4"
 
 [[package]]
 name = "wry"
-version = "0.52.1"
+version = "0.55.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "12a714d9ba7075aae04a6e50229d6109e3d584774b99a6a8c60de1698ca111b9"
+checksum = "186f9871daa55fd9c016578b810d149de58367113db7fb72b462d2323ce19514"
 dependencies = [
  "base64 0.22.1",
- "block2 0.6.1",
- "cookie 0.18.1",
+ "block2",
+ "cookie",
  "crossbeam-channel",
+ "dirs",
+ "dom_query",
  "dpi",
  "dunce",
  "gdkx11",
  "gtk",
- "html5ever",
  "http",
  "javascriptcore-rs",
  "jni",
- "kuchikiki",
  "libc",
  "ndk",
- "objc2 0.6.2",
- "objc2-app-kit 0.3.1",
+ "objc2",
+ "objc2-app-kit",
  "objc2-core-foundation",
- "objc2-foundation 0.3.1",
+ "objc2-foundation",
  "objc2-ui-kit",
  "objc2-web-kit",
  "once_cell",
@@ -6338,12 +5999,12 @@ dependencies = [
  "sha2",
  "soup3",
  "tao-macros",
- "thiserror 2.0.15",
+ "thiserror 2.0.18",
  "url",
  "webkit2gtk",
  "webkit2gtk-sys",
  "webview2-com",
- "windows 0.61.3",
+ "windows",
  "windows-core 0.61.2",
  "windows-version",
  "x11-dl",
@@ -6351,9 +6012,9 @@ dependencies = [
 
 [[package]]
 name = "x11"
-version = "2.20.1"
+version = "2.21.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "c2638d5b9c17ac40575fb54bb461a4b1d2a8d1b4ffcc4ff237d254ec59ddeb82"
+checksum = "502da5464ccd04011667b11c435cb992822c2c0dbde1770c988480d312a0db2e"
 dependencies = [
  "libc",
  "pkg-config",
@@ -6372,52 +6033,20 @@ dependencies = [
 
 [[package]]
 name = "x11rb"
-version = "0.10.1"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "592b4883219f345e712b3209c62654ebda0bb50887f330cbd018d0f654bfd507"
-dependencies = [
- "gethostname 0.2.3",
- "nix 0.24.3",
- "winapi",
- "winapi-wsapoll",
- "x11rb-protocol 0.10.0",
-]
-
-[[package]]
-name = "x11rb"
-version = "0.13.1"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "5d91ffca73ee7f68ce055750bf9f6eca0780b8c85eff9bc046a3b0da41755e12"
-dependencies = [
- "gethostname 0.4.3",
- "rustix 0.38.44",
- "x11rb-protocol 0.13.1",
-]
-
-[[package]]
-name = "x11rb-protocol"
-version = "0.10.0"
+version = "0.13.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "56b245751c0ac9db0e006dc812031482784e434630205a93c73cfefcaabeac67"
+checksum = "9993aa5be5a26815fe2c3eacfc1fde061fc1a1f094bf1ad2a18bf9c495dd7414"
 dependencies = [
- "nix 0.24.3",
+ "gethostname",
+ "rustix",
+ "x11rb-protocol",
 ]
 
 [[package]]
 name = "x11rb-protocol"
-version = "0.13.1"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "ec107c4503ea0b4a98ef47356329af139c0a4f7750e621cf2973cd3385ebcb3d"
-
-[[package]]
-name = "xdg-home"
-version = "1.3.0"
+version = "0.13.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "ec1cdab258fb55c0da61328dc52c8764709b249011b2cad0454c72f0bf10a1f6"
-dependencies = [
- "libc",
- "windows-sys 0.59.0",
-]
+checksum = "ea6fc2961e4ef194dcbfe56bb845534d0dc8098940c7e5c012a258bfec6701bd"
 
 [[package]]
 name = "xkeysym"
@@ -6425,19 +6054,12 @@ version = "0.2.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
 checksum = "b9cc00251562a284751c9973bace760d86c0276c471b4be569fe6b068ee97a56"
 
-[[package]]
-name = "xml-rs"
-version = "0.8.4"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "d2d7d3948613f75c98fd9328cfdcc45acc4d360655289d0a7d4ec931392200a3"
-
 [[package]]
 name = "yoke"
-version = "0.8.0"
+version = "0.8.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "5f41bb01b8226ef4bfd589436a297c53d118f65921786300e427be8d487695cc"
+checksum = "abe8c5fda708d9ca3df187cae8bfb9ceda00dd96231bed36e445a1a48e66f9ca"
 dependencies = [
- "serde",
  "stable_deref_trait",
  "yoke-derive",
  "zerofrom",
@@ -6445,25 +6067,24 @@ dependencies = [
 
 [[package]]
 name = "yoke-derive"
-version = "0.8.0"
+version = "0.8.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "38da3c9736e16c5d3c8c597a9aaa5d1fa565d0532ae05e27c24aa62fb32c0ab6"
+checksum = "de844c262c8848816172cef550288e7dc6c7b7814b4ee56b3e1553f275f1858e"
 dependencies = [
  "proc-macro2",
  "quote",
- "syn 2.0.106",
+ "syn 2.0.117",
  "synstructure",
 ]
 
 [[package]]
 name = "zbus"
-version = "4.0.1"
+version = "5.15.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "7b8e3d6ae3342792a6cc2340e4394334c7402f3d793b390d2c5494a4032b3030"
+checksum = "c3bcbf15c8708d7fc1be0c993622e0a5cbd5e8b52bfa40afa4c3e0cd8d724ac1"
 dependencies = [
  "async-broadcast",
  "async-executor",
- "async-fs",
  "async-io",
  "async-lock",
  "async-process",
@@ -6471,25 +6092,21 @@ dependencies = [
  "async-task",
  "async-trait",
  "blocking",
- "derivative",
  "enumflags2",
  "event-listener",
  "futures-core",
- "futures-sink",
- "futures-util",
+ "futures-lite",
  "hex",
- "nix 0.27.1",
+ "libc",
  "ordered-stream",
- "rand 0.8.5",
+ "rustix",
  "serde",
  "serde_repr",
- "sha1",
- "static_assertions",
- "tokio",
  "tracing",
  "uds_windows",
- "windows-sys 0.52.0",
- "xdg-home",
+ "uuid",
+ "windows-sys 0.61.2",
+ "winnow 1.0.2",
  "zbus_macros",
  "zbus_names",
  "zvariant",
@@ -6497,61 +6114,82 @@ dependencies = [
 
 [[package]]
 name = "zbus_macros"
-version = "4.0.1"
+version = "5.15.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "b7a3e850ff1e7217a3b7a07eba90d37fe9bb9e89a310f718afcde5885ca9b6d7"
+checksum = "51fa5406ad9175a8c825a931f8cf347116b531b3634fcb0b627c290f1f2516ff"
 dependencies = [
- "proc-macro-crate 1.2.1",
+ "proc-macro-crate 3.5.0",
  "proc-macro2",
  "quote",
- "regex",
- "syn 1.0.105",
+ "syn 2.0.117",
+ "zbus_names",
+ "zvariant",
  "zvariant_utils",
 ]
 
 [[package]]
 name = "zbus_names"
-version = "3.0.0"
+version = "4.3.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "4b9b1fef7d021261cc16cba64c351d291b715febe0fa10dc3a443ac5a5022e6c"
+checksum = "7074f3e50b894eac91750142016d30d0a89be8e67dbfd9704fb875825760e52d"
 dependencies = [
  "serde",
- "static_assertions",
+ "winnow 1.0.2",
  "zvariant",
 ]
 
+[[package]]
+name = "zerocopy"
+version = "0.8.48"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "eed437bf9d6692032087e337407a86f04cd8d6a16a37199ed57949d415bd68e9"
+dependencies = [
+ "zerocopy-derive",
+]
+
+[[package]]
+name = "zerocopy-derive"
+version = "0.8.48"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "70e3cd084b1788766f53af483dd21f93881ff30d7320490ec3ef7526d203bad4"
+dependencies = [
+ "proc-macro2",
+ "quote",
+ "syn 2.0.117",
+]
+
 [[package]]
 name = "zerofrom"
-version = "0.1.6"
+version = "0.1.7"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "50cc42e0333e05660c3587f3bf9d0478688e15d870fab3346451ce7f8c9fbea5"
+checksum = "69faa1f2a1ea75661980b013019ed6687ed0e83d069bc1114e2cc74c6c04c4df"
 dependencies = [
  "zerofrom-derive",
 ]
 
 [[package]]
 name = "zerofrom-derive"
-version = "0.1.6"
+version = "0.1.7"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "d71e5d6e06ab090c67b5e44993ec16b72dcbaabc526db883a360057678b48502"
+checksum = "11532158c46691caf0f2593ea8358fed6bbf68a0315e80aae9bd41fbade684a1"
 dependencies = [
  "proc-macro2",
  "quote",
- "syn 2.0.106",
+ "syn 2.0.117",
  "synstructure",
 ]
 
 [[package]]
 name = "zeroize"
-version = "1.8.1"
+version = "1.8.2"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "ced3678a2879b30306d323f4542626697a464a97c0a07c9aebf7ebca65cd4dde"
+checksum = "b97154e67e32c85465826e8bcc1c59429aaaf107c1e4a9e53c8d8ccd5eff88d0"
 
 [[package]]
 name = "zerotrie"
-version = "0.2.2"
+version = "0.2.4"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "36f0bbd478583f79edad978b407914f61b2972f5af6fa089686016be8f9af595"
+checksum = "0f9152d31db0792fa83f70fb2f83148effb5c1f5b8c7686c3459e361d9bc20bf"
 dependencies = [
  "displaydoc",
  "yoke",
@@ -6560,9 +6198,9 @@ dependencies = [
 
 [[package]]
 name = "zerovec"
-version = "0.11.4"
+version = "0.11.6"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "e7aa2bd55086f1ab526693ecbe444205da57e25f4489879da80635a46d90e73b"
+checksum = "90f911cbc359ab6af17377d242225f4d75119aec87ea711a880987b18cd7b239"
 dependencies = [
  "yoke",
  "zerofrom",
@@ -6571,49 +6209,72 @@ dependencies = [
 
 [[package]]
 name = "zerovec-derive"
-version = "0.11.1"
+version = "0.11.3"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "5b96237efa0c878c64bd89c436f661be4e46b2f3eff1ebb976f7ef2321d2f58f"
+checksum = "625dc425cab0dca6dc3c3319506e6593dcb08a9f387ea3b284dbd52a92c40555"
 dependencies = [
  "proc-macro2",
  "quote",
- "syn 2.0.106",
+ "syn 2.0.117",
+]
+
+[[package]]
+name = "zmij"
+version = "1.0.21"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "b8848ee67ecc8aedbaf3e4122217aff892639231befc6a1b58d29fff4c2cabaa"
+
+[[package]]
+name = "zune-core"
+version = "0.5.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "cb8a0807f7c01457d0379ba880ba6322660448ddebc890ce29bb64da71fb40f9"
+
+[[package]]
+name = "zune-jpeg"
+version = "0.5.15"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "27bc9d5b815bc103f142aa054f561d9187d191692ec7c2d1e2b4737f8dbd7296"
+dependencies = [
+ "zune-core",
 ]
 
 [[package]]
 name = "zvariant"
-version = "4.0.0"
+version = "5.11.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "4e09e8be97d44eeab994d752f341e67b3b0d80512a8b315a0671d47232ef1b65"
+checksum = "1c1567a6ec68df868cbbfde844cfc6d81649fe5109a62b116b19fabd53e618ee"
 dependencies = [
  "endi",
  "enumflags2",
  "serde",
- "static_assertions",
- "url",
+ "winnow 1.0.2",
  "zvariant_derive",
+ "zvariant_utils",
 ]
 
 [[package]]
 name = "zvariant_derive"
-version = "4.0.0"
+version = "5.11.0"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "72a5857e2856435331636a9fbb415b09243df4521a267c5bedcd5289b4d5799e"
+checksum = "c7d5b780599bbde114e39d9a0799577fad1ced5105d38515745f7b3099d8ceda"
 dependencies = [
- "proc-macro-crate 1.2.1",
+ "proc-macro-crate 3.5.0",
  "proc-macro2",
  "quote",
- "syn 1.0.105",
+ "syn 2.0.117",
  "zvariant_utils",
 ]
 
 [[package]]
 name = "zvariant_utils"
-version = "1.1.0"
+version = "3.3.1"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "00bedb16a193cc12451873fee2a1bc6550225acece0e36f333e68326c73c8172"
+checksum = "6d464f5733ffa07a3164d656f18533caace9d0638596721355d73256a410d691"
 dependencies = [
  "proc-macro2",
  "quote",
- "syn 1.0.105",
+ "serde",
+ "syn 2.0.117",
+ "winnow 1.0.2",
 ]
-- 
2.52.0

