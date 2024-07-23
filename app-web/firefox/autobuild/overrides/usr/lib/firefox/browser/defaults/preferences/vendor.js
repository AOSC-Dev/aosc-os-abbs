// Use LANG environment variable to choose locale.
pref("intl.locale.requested",			"");

// Disable default browser checking.
pref("browser.shell.checkDefaultBrowser",	false);

// Don't disable our bundled extensions in the application directory.
pref("extensions.autoDisableScopes",		11);
pref("extensions.shownSelectionUI",		true);

// Disable unified extensions button.
pref("extensions.unifiedExtensions.enabled",	false);

// Enable userChrome.css support.
pref("toolkit.legacyUserProfileCustomizations.stylesheets",	true);

// Disable oft-broken client-side decoration.
pref("browser.tabs.inTitlebar",			0);

// Let the system handle DPI scaling.
pref("layout.css.devPixelsPerPx",		-1);

// ... from Fedora ...

// Disable auto update.
pref("app.update.auto",				false);
pref("app.update.enabled",			false);
pref("app.update.autoInstallEnabled",		false);

// Enable smooth scrolling.
pref("general.smoothScroll",			true);

// Auto detect offline status.
pref("offline.autoDetect",			true);
pref("network.manage-offline-status",		true);

// Ask about which directory to download to.
pref("browser.download.folderList",		1);

// Capture links opened from other applications, and open in a new tab.
pref("browser.link.open_external",		3);

// Let XDG Desktop Portal handle file pickers.
// This allows Firefox to use native file dialogs (such as KDE).
pref("widget.use-xdg-desktop-portal.file-picker",		1);

// ... from Gentoo ...

// Use system defined typography colors.
pref("browser.display.use_system_colors",	true);

// Backspace defined to go back a page in session history.
pref("browser.backspace_action",		0);

// Do not bother those who wouldn't want Firefox as default anyways.
pref("browser.shell.checkDefaultBrowser",	false);

// Always use system defined logical resolution for CSS DPI detection.
pref("layout.css.dpi",				0);

// ... AOSC OS policies ...
// Enable Hardware acceleration.
pref("media.ffmpeg.vaapi.enabled",             true);

// Disable Pocket by default.
pref("browser.pocket.enabled",			false);
pref("extensions.pocket.enabled",		false);
pref("browser.newtabpage.activity-stream.section.highlights.includePocket",	false);

// Disable (targeted) sponsored contents.
pref("browser.newtabpage.activity-stream.showSponsored",	false);
pref("browser.newtabpage.activity-stream.disableSnippets",	true);
pref("browser.newtabpage.activity-stream.feeds.snippets",	false);
pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons",	false);
pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features",	false);
pref("browser.newtabpage.activity-stream.showSponsoredTopSites",		false);
pref("services.sync.prefs.sync.browser.newtabpage.activity-stream.showSponsored",	false);
pref("services.sync.prefs.sync.browser.newtabpage.activity-stream.showSponsoredTopSites", false);
pref("browser.newtabpage.activity-stream.discoverystream.spocs.personalized",	false);

// Disable Telemetry.
pref("browser.newtabpage.activity-stream.feeds.telemetry",	false);
pref("browser.newtabpage.activity-stream.telemetry",		false);
pref("browser.newtabpage.activity-stream.telemetry.ut.events",	false);
pref("browser.ping-centre.telemetry",				false);
pref("devtools.onboarding.telemetry.logged",			false);
pref("security.certerrors.recordEventTelemetry",		false);
pref("security.identitypopup.recordEventElemetry",		false);
pref("toolkit.telemetry.archive.enabled",			false);
pref("toolkit.telemetry.bhrPing.enabled",			false);
pref("toolkit.telemetry.dap_enabled",				false);
pref("toolkit.telemetry.enabled",				false);
pref("toolkit.telemetry.firstShutdownPing.enabled",		false);
pref("toolkit.telemetry.hybridContent.enabled",			false);
pref("toolkit.telemetry.newProfilePing.enabled",		false);
pref("toolkit.telemetry.reportingpolicy.firstRun",		false);
pref("toolkit.telemetry.shutdownPingSender.enabled",		false);
pref("toolkit.telemetry.shutdownPingSender.enabledFirstSession",false);
pref("toolkit.telemetry.unified",				false);
pref("toolkit.telemetry.updatePing.enabled",			false);
pref("security.identitypopup.recordEventTelemetry",		false);
pref("security.protectionspopup.recordEventTelemetry",		false);
pref("security.app_menu.recordEventTelemetry",			false);
pref("dom.security.unexpected_system_load_telemetry_enabled",	false);
pref("toolkit.telemetry.pioneer-new-studies-available",		false);
pref("datareporting.healthreport.uploadEnabled",		false);
