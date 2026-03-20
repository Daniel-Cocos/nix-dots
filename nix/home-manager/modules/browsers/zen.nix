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
            --zen-page-bg: rgba(8, 8, 12, 0.16) !important;
            --zen-page-bg-soft: rgba(8, 8, 12, 0.10) !important;
            --zen-page-bg-strong: rgba(8, 8, 12, 0.26) !important;
            --zen-page-border: rgba(255, 255, 255, 0.08) !important;
            --zen-page-blur: 18px !important;
            --zen-text: rgba(255, 255, 255, 0.96) !important;
            --zen-text-muted: rgba(235, 235, 245, 0.74) !important;
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
          .color-canvas-subtle,
          .bgColor-default,
          .bgColor-muted {
            background: transparent !important;
            background-color: transparent !important;
            background-image: none !important;
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
            background-image: none !important;
            backdrop-filter: blur(var(--zen-page-blur)) saturate(135%) !important;
            -webkit-backdrop-filter: blur(var(--zen-page-blur)) saturate(135%) !important;
            border-color: var(--zen-page-border) !important;
            box-shadow: none !important;
          }
        }

        @-moz-document domain("youtube.com"), domain("www.youtube.com") {
          ytd-masthead,
          #masthead-container,
          #masthead,
          #background,
          #frosted-glass,
          #container.ytd-masthead,
          #start.ytd-masthead,
          #center.ytd-masthead,
          #end.ytd-masthead,
          #search.ytd-masthead,
          ytd-topbar-logo-renderer,
          ytd-searchbox,
          .ytd-searchbox,
          #search-form,
          form#search-form,
          #search-icon-legacy,
          #voice-search-button,
          yt-searchbox,
          yt-searchbox div,
          #chips-wrapper,
          #chips,
          #header-container,
          #filter-menu,
          ytd-feed-filter-chip-bar-renderer,
          ytd-feed-filter-chip-bar-renderer #background,
          ytd-feed-filter-chip-bar-renderer #chips-wrapper,
          yt-chip-cloud-renderer,
          yt-chip-cloud-renderer #container,
          yt-chip-cloud-chip-renderer,
          yt-chip-cloud-chip-renderer #chip-container,
          yt-chip-cloud-chip-renderer[chip-style] #chip-container,
          tp-yt-paper-tabs,
          ytd-search-header-renderer,
          ytd-two-column-browse-results-renderer,
          ytd-browse[page-subtype="home"],
          #page-header-container,
          #guide-button,
          ytd-mini-guide-renderer,
          ytd-guide-section-renderer,
          ytd-guide-entry-renderer {
            background: var(--zen-page-bg) !important;
            background-color: var(--zen-page-bg) !important;
            background-image: none !important;
            backdrop-filter: blur(var(--zen-page-blur)) saturate(135%) !important;
            -webkit-backdrop-filter: blur(var(--zen-page-blur)) saturate(135%) !important;
            border-color: var(--zen-page-border) !important;
            box-shadow: none !important;
          }

          #masthead-container::before,
          #masthead::before,
          ytd-masthead::before,
          ytd-feed-filter-chip-bar-renderer::before,
          ytd-feed-filter-chip-bar-renderer::after,
          yt-chip-cloud-renderer::before,
          yt-searchbox::before,
          yt-searchbox::after {
            background: transparent !important;
            background-color: transparent !important;
            background-image: none !important;
            box-shadow: none !important;
          }

          #masthead-container.ytd-app,
          .style-scope.ytd-app[is-watch-page],
          .style-scope.ytd-app[guide-persistent-and-visible],
          ytd-app[guide-persistent-and-visible] #masthead-container,
          ytd-app[mini-guide-visible] #masthead-container,
          ytd-app[guide-persistent-and-visible] #chips-wrapper,
          ytd-app[mini-guide-visible] #chips-wrapper,
          #contentContainer.tp-yt-app-header-layout,
          tp-yt-app-header-layout,
          tp-yt-app-drawer-layout {
            background: var(--zen-page-bg) !important;
            background-color: var(--zen-page-bg) !important;
            background-image: none !important;
            backdrop-filter: blur(var(--zen-page-blur)) saturate(135%) !important;
            -webkit-backdrop-filter: blur(var(--zen-page-blur)) saturate(135%) !important;
            border-color: var(--zen-page-border) !important;
            box-shadow: none !important;
          }
        }

        @-moz-document domain("github.com") {
          :root,
          [data-color-mode],
          [data-color-mode="dark"] {
            --bgColor-default: transparent !important;
            --bgColor-muted: var(--zen-page-bg-soft) !important;
            --bgColor-emphasis: var(--zen-page-bg-strong) !important;
            --overlay-bgColor: var(--zen-page-bg-strong) !important;
            --borderColor-default: var(--zen-page-border) !important;
            --borderColor-muted: rgba(255, 255, 255, 0.05) !important;
            --fgColor-default: var(--zen-text) !important;
            --fgColor-muted: var(--zen-text-muted) !important;
            --fgColor-onEmphasis: var(--zen-text) !important;
            --color-canvas-default: transparent !important;
            --color-canvas-overlay: var(--zen-page-bg-strong) !important;
            --color-canvas-inset: transparent !important;
            --color-canvas-subtle: var(--zen-page-bg-soft) !important;
            --color-border-default: var(--zen-page-border) !important;
            --color-border-muted: rgba(255, 255, 255, 0.05) !important;
            --color-fg-default: var(--zen-text) !important;
            --color-fg-muted: var(--zen-text-muted) !important;
            --color-fg-subtle: rgba(235, 235, 245, 0.64) !important;
          }

          html,
          body,
          .logged-in,
          .application-main,
          .Layout,
          .Layout-main,
          .Layout-sidebar,
          .feed-background,
          .js-snippet-clipboard-copy-unpositioned,
          .color-bg-default,
          .color-bg-subtle,
          .color-canvas-default,
          .color-canvas-subtle,
          .bgColor-default,
          .bgColor-muted {
            background: transparent !important;
            background-color: transparent !important;
            background-image: none !important;
            color: var(--zen-text) !important;
          }

          .AppHeader,
          .Header,
          .Header-old,
          .js-header-wrapper,
          header[role="banner"],
          .header-logged-out,
          .HeaderMenu,
          .HeaderMenu-nav,
          .HeaderMenu-link,
          .HeaderMenu-summary,
          .HeaderMenu-details,
          .HeaderMenu-dropdown,
          .HeaderMenu-column,
          .HeaderMenu-column-border,
          .Header-item,
          .AppHeader-globalBar,
          .AppHeader-localBar,
          .AppHeader-search,
          .AppHeader-actions,
          .AppHeader-context,
          #repository-container-header,
          .UnderlineNav,
          .UnderlineNav-body,
          .Box,
          .Box-header,
          .Box-body,
          .Box-row,
          .BorderGrid,
          .BorderGrid-row,
          .BorderGrid-cell,
          .flash,
          .Popover,
          .Overlay,
          .dropdown-menu,
          .menu,
          .SelectMenu-modal,
          .commit-tease,
          .file,
          .file-header,
          .file-info,
          .discussion-timeline-actions,
          .table-list-header,
          .subnav,
          .repository-content,
          .gsc-results,
          .markdown-body table tr,
          .markdown-body td,
          .markdown-body th,
          .markdown-body pre,
          .markdown-body blockquote,
          .markdown-body .highlight pre,
          .social-count,
          .topic-tag {
            background: var(--zen-page-bg) !important;
            background-color: var(--zen-page-bg) !important;
            background-image: none !important;
            backdrop-filter: blur(var(--zen-page-blur)) saturate(135%) !important;
            -webkit-backdrop-filter: blur(var(--zen-page-blur)) saturate(135%) !important;
            border-color: var(--zen-page-border) !important;
            box-shadow: none !important;
            color: var(--zen-text) !important;
          }

          .btn,
          .Button,
          .prc-Button-ButtonBase-c50BI,
          .Button--secondary,
          .Button--default,
          .Button--primary,
          .social-count,
          summary.btn,
          a.btn,
          button,
          [role="button"],
          .HeaderMenu-link,
          .HeaderMenu-summary,
          .Header-item,
          .Header-link,
          .AppHeader-button,
          .AppHeader-actions button,
          .AppHeader-actions a {
            background: transparent !important;
            background-color: transparent !important;
            background-image: none !important;
            border-color: transparent !important;
            box-shadow: none !important;
            color: var(--zen-text) !important;
          }

          .markdown-body,
          .markdown-body h1,
          .markdown-body h2,
          .markdown-body h3,
          .markdown-body h4,
          .markdown-body h5,
          .markdown-body h6,
          .markdown-title,
          .markdown-heading,
          .Box-title,
          .js-issue-title,
          .Link--primary,
          .Link--secondary,
          .Link--muted,
          .fgColor-default,
          .color-fg-default {
            color: var(--zen-text) !important;
          }

          .markdown-body p,
          .markdown-body li,
          .markdown-body td,
          .markdown-body th,
          .markdown-body summary,
          .fgColor-muted,
          .color-fg-muted,
          .color-fg-subtle,
          .Link--secondary,
          .Link--muted,
          .commit-desc,
          .color-text-secondary {
            color: var(--zen-text-muted) !important;
          }

          .markdown-body table,
          .markdown-body tbody,
          .markdown-body thead,
          .markdown-body tr {
            background: transparent !important;
            background-color: transparent !important;
            background-image: none !important;
          }

          .HeaderMenu-link:hover,
          .HeaderMenu-summary:hover,
          .Header-item:hover,
          .Header-link:hover,
          .HeaderMenu-link:focus,
          .HeaderMenu-summary:focus,
          .Header-item:focus,
          .Header-link:focus,
          .AppHeader-button:hover,
          .AppHeader-button:focus {
            background: var(--zen-page-bg-soft) !important;
            background-color: var(--zen-page-bg-soft) !important;
            backdrop-filter: blur(var(--zen-page-blur)) saturate(135%) !important;
            -webkit-backdrop-filter: blur(var(--zen-page-blur)) saturate(135%) !important;
            border-color: var(--zen-page-border) !important;
            color: var(--zen-text) !important;
          }

          .markdown-body td,
          .markdown-body th {
            background: var(--zen-page-bg) !important;
            background-color: var(--zen-page-bg) !important;
            backdrop-filter: blur(var(--zen-page-blur)) saturate(135%) !important;
            -webkit-backdrop-filter: blur(var(--zen-page-blur)) saturate(135%) !important;
          }
        }
      '';
    };
  };
}
