// Use LANG environment variable to choose locale
pref("intl.locale.requested",				"");

// Use system-provided dictionaries
pref("spellchecker.dictionary_path",			"/usr/share/hunspell");

// Disable default mailer checking.
pref("mail.shell.checkDefaultMail",			false);

// Don't disable our bundled extensions in the application directory.
pref("extensions.autoDisableScopes",			11);
pref("extensions.shownSelectionUI",			true);

// Let XDG Desktop Portal handle file pickers.
// This allows Firefox to use native file dialogs (such as KDE).
pref("widget.use-xdg-desktop-portal.file-picker",	1);

// Disable oft-broken client-side decoration.
pref("mail.tabs.drawInTitlebar",			false);

// ... From Fedora ...

// Disable auto update.
pref("app.update.enabled",				false);
pref("app.update.autoInstallEnabled",			false);

// Detect offline status.
pref("offline.autoDetect",				true);

// Disable telemetry (AOSC OS policy).
pref("datareporting.healthreport.uploadEnabled",	false);
pref("datareporting.policy.dataSubmissionEnabled",	false);
pref("toolkit.telemetry.archive.enabled",		false);

// Default to our default font size (10px).
pref("mail.uifontsize",					10);

// Default to the "compact" (0) UI density, as it seems more appropriate for desktop devices.
pref("mail.uidensity",					0);
