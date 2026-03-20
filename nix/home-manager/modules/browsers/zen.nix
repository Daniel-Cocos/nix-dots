{ config, pkgs, inputs, ... }:
let
  addons = inputs.firefox-addons.packages.${pkgs.system};
in
{
  programs.zen-browser = {
    enable = true;
    package = inputs.zen-browser.packages.${pkgs.system}.default;

    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableFeedbackCommands = true;
      OfferToSaveLogins = false;
      PasswordManagerEnabled = false;
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;
      DontCheckDefaultBrowser = true;
      DisplayBookmarksToolbar = "never";
      SearchSuggestEnabled = false;
      FirefoxSuggest = {
        WebSuggestions = false;
        SponsoredSuggestions = false;
        ImproveSuggest = false;
      };
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };

      ExtensionSettings = {
        "*" = {
          installation_mode = "allowed";
        };
      };
    };

    profiles.default = {
      id = 0;
      name = "default";
      isDefault = true;

      extensions.packages = with addons; [
        ublock-origin
        darkreader
        vimium
        canvasblocker
        multi-account-containers
        temporary-containers
        cookie-autodelete
      ];

      settings = {
        "browser.tabs.allow_transparent_browser" = true;
        "widget.gtk.ignore-bogus-leave-notify" = 1;

        "browser.theme.dark-private-windows" = true;
        "layout.css.prefers-color-scheme.content-override" = 0;
        "browser.display.background_color" = "#00000000";
        "browser.display.background_color.dark" = "#00000000";
        "browser.display.document_color_use" = 1;

        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;

        "zen.view.compact" = true;
        "zen.view.use-single-toolbar" = true;

        "browser.newtabpage.activity-stream.feeds.topsites" = false;
        "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.search.suggest.enabled" = false;
        "browser.urlbar.suggest.searches" = false;
        "browser.formfill.enable" = false;

        "browser.discovery.enabled" = false;
        "app.normandy.enabled" = false;
        "app.shield.optoutstudies.enabled" = false;
        "datareporting.healthreport.uploadEnabled" = false;
        "datareporting.policy.dataSubmissionEnabled" = false;
        "toolkit.telemetry.enabled" = false;
        "toolkit.telemetry.unified" = false;
        "toolkit.telemetry.archive.enabled" = false;
        "toolkit.telemetry.server" = "";
        "browser.ping-centre.telemetry" = false;

        "privacy.trackingprotection.enabled" = true;
        "privacy.trackingprotection.socialtracking.enabled" = true;
        "privacy.donottrackheader.enabled" = true;
        "privacy.globalprivacycontrol.enabled" = true;
        "privacy.query_stripping.enabled" = true;
        "privacy.fingerprintingProtection" = true;
        "privacy.resistFingerprinting" = true;

        "network.http.referer.XOriginPolicy" = 2;
        "network.http.referer.XOriginTrimmingPolicy" = 2;
        "network.prefetch-next" = false;
        "network.predictor.enabled" = false;
        "network.dns.disablePrefetch" = true;
        "browser.urlbar.speculativeConnect.enabled" = false;

        "media.peerconnection.enabled" = false;
        "geo.enabled" = false;
        "permissions.default.geo" = 2;
        "permissions.default.camera" = 2;
        "permissions.default.microphone" = 2;
        "permissions.default.desktop-notification" = 2;

        "dom.security.https_only_mode" = true;
        "browser.contentblocking.category" = "strict";

        "sidebar.revamp" = false;
        "sidebar.verticalTabs" = false;
      };

      userChrome = ''
        :root {
          --zen-browser-blur: 22px;
          --zen-surface: rgba(10, 10, 14, 0.22);
          --zen-surface-strong: rgba(10, 10, 14, 0.34);
          --zen-border: rgba(255, 255, 255, 0.08);
        }

        #main-window,
        #navigator-toolbox,
        #browser,
        #appcontent,
        #tabbrowser-tabbox,
        #tabbrowser-tabpanels,
        browser[type="content-primary"],
        browser[type="content"],
        .browserStack,
        #zen-appcontent-navbar-container,
        #zen-sidebar-web-panel,
        #zen-sidebar-splitter,
        #sidebar-box,
        #sidebar-main,
        #zen-workspaces-button {
          background: transparent !important;
          background-color: transparent !important;
        }

        #navigator-toolbox,
        #TabsToolbar,
        #titlebar,
        #PersonalToolbar,
        #nav-bar,
        #zen-appcontent-navbar-container {
          backdrop-filter: blur(var(--zen-browser-blur)) saturate(140%) !important;
          -webkit-backdrop-filter: blur(var(--zen-browser-blur)) saturate(140%) !important;
          background: var(--zen-surface) !important;
          border-color: var(--zen-border) !important;
          box-shadow: none !important;
        }

        #sidebar-box,
        #sidebar-main,
        #zen-sidebar-web-panel,
        #zen-sidebar-splitter {
          display: none !important;
          visibility: collapse !important;
          width: 0 !important;
          min-width: 0 !important;
          max-width: 0 !important;
        }
      '';

      userContent = ''
        @-moz-document url-prefix("about:"),
        url-prefix("chrome://browser/content/"),
        domain("google.com"),
        domain("www.google.com"),
        domain("youtube.com"),
        domain("www.youtube.com"),
        domain("github.com") {
          :root {
            --zen-page-bg: rgba(8, 8, 12, 0.18) !important;
            --zen-page-bg-strong: rgba(8, 8, 12, 0.28) !important;
            --zen-page-border: rgba(255, 255, 255, 0.07) !important;
            --zen-page-blur: 18px !important;
          }

          html,
          body,
          #app,
          #content,
          #page-manager,
          ytd-app,
          #masthead-container,
          #columns,
          #primary,
          #secondary,
          #guide-content,
          [role="main"],
          main,
          .gb_x,
          .gb_Ld,
          .sfbg,
          .minidiv,
          .RNNXgb,
          .aajZCb,
          .yg51vc,
          .LX3sZb,
          .application-main,
          .Header,
          .AppHeader,
          .feed-background,
          .color-bg-default,
          .color-bg-subtle,
          .color-canvas-default,
          .color-canvas-subtle {
            background: transparent !important;
            background-color: transparent !important;
          }

          #searchform,
          #rhs,
          #rcnt,
          #center_col,
          #top_nav,
          #hdtb-sc,
          .s,
          .tF2Cxc,
          .MjjYud,
          .g,
          ytd-watch-flexy,
          ytd-rich-grid-renderer,
          ytd-video-renderer,
          ytd-guide-renderer,
          #masthead,
          #container,
          #chips-wrapper,
          .Layout,
          .AppHeader,
          .Header,
          .Header-old,
          .application-main,
          .Box,
          .Box-body,
          .Box-header,
          .flash,
          .Overlay,
          .Popover,
          .HeaderMenu-dropdown {
            background: var(--zen-page-bg) !important;
            background-color: var(--zen-page-bg) !important;
            backdrop-filter: blur(var(--zen-page-blur)) saturate(135%) !important;
            -webkit-backdrop-filter: blur(var(--zen-page-blur)) saturate(135%) !important;
            border-color: var(--zen-page-border) !important;
            box-shadow: none !important;
          }
        }
      '';
    };
  };
}
