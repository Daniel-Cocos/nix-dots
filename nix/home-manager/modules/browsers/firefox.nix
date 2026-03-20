{ pkgs, ... }:
{
  programs.firefox = {
    enable = true;
    package = pkgs.firefox;

    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableFirefoxScreenshots = true;
      DisableSetDesktopBackground = true;
      DontCheckDefaultBrowser = true;
      NoDefaultBookmarks = true;
      OfferToSaveLogins = false;
      PasswordManagerEnabled = false;
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;
      SearchSuggestEnabled = false;
      TranslateEnabled = false;
      DisplayBookmarksToolbar = "never";
      HttpsOnlyMode = "enabled";
      PromptForDownloadLocation = true;

      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
        EmailTracking = true;
      };

      FirefoxHome = {
        Search = true;
        TopSites = false;
        SponsoredTopSites = false;
        Highlights = false;
        Pocket = false;
        SponsoredPocket = false;
        Snippets = false;
        Locked = false;
      };

      Permissions = {
        Camera = {
          BlockNewRequests = true;
        };
        Microphone = {
          BlockNewRequests = true;
        };
        Location = {
          BlockNewRequests = true;
        };
        Notifications = {
          BlockNewRequests = true;
        };
      };

      UserMessaging = {
        ExtensionRecommendations = false;
        FeatureRecommendations = false;
        UrlbarInterventions = false;
        MoreFromMozilla = false;
        SkipOnboarding = true;
        FirefoxLabs = false;
      };

      ExtensionSettings = {
        "uBlock0@raymondhill.net" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          default_area = "navbar";
        };

        "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
          default_area = "navbar";
        };

        "@testpilot-containers" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/multi-account-containers/latest.xpi";
          default_area = "navbar";
        };

        "jid1-MnnxcxisBPnSXQ@jetpack" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17/latest.xpi";
          default_area = "navbar";
        };

        "{74145f27-f039-47ce-a470-a662b129930a}" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/clearurls/latest.xpi";
          default_area = "navbar";
        };

        "vimium-c@gdh1995.cn" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/vimium-c/latest.xpi";
          default_area = "navbar";
        };

        "addon@darkreader.org" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/darkreader/latest.xpi";
          default_area = "navbar";
        };
      };
    };

    profiles.main = {
      id = 0;
      isDefault = true;
      name = "main";
      containersForce = true;

      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "extensions.autoDisableScopes" = 0;

        "browser.startup.page" = 1;
        "browser.startup.homepage" = "https://duckduckgo.com/?kp=-1&kl=wt-wt";
        "browser.startup.homepage_override.mstone" = "ignore";
        "startup.homepage_welcome_url" = "";
        "startup.homepage_welcome_url.additional" = "";

        "browser.newtabpage.enabled" = true;
        "browser.shell.checkDefaultBrowser" = false;
        "browser.toolbars.bookmarks.visibility" = "never";
        "browser.tabs.closeWindowWithLastTab" = false;

        "browser.compactmode.show" = true;
        "browser.uidensity" = 1;
        "browser.tabs.drawInTitlebar" = true;

        "browser.tabs.allow_transparent_browser" = true;
        "browser.theme.toolbar-theme" = 0;
        "browser.theme.content-theme" = 0;

        "browser.search.suggest.enabled" = false;
        "browser.urlbar.suggest.searches" = false;
        "browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
        "browser.urlbar.suggest.quicksuggest.sponsored" = false;
        "browser.urlbar.suggest.topsites" = false;
        "browser.urlbar.suggest.trending" = false;
        "browser.urlbar.speculativeConnect.enabled" = false;

        "browser.discovery.enabled" = false;
        "extensions.pocket.enabled" = false;
        "extensions.getAddons.showPane" = false;
        "extensions.htmlaboutaddons.recommendations.enabled" = false;
        "signon.rememberSignons" = false;
        "browser.formfill.enable" = false;
        "dom.security.https_only_mode" = true;
        "datareporting.healthreport.uploadEnabled" = false;
        "app.shield.optoutstudies.enabled" = false;
        "identity.fxaccounts.enabled" = false;

        "browser.newtabpage.activity-stream.feeds.snippets" = false;
        "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.system.showSponsored" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.newtabpage.activity-stream.feeds.topsites" = false;

        "browser.contentblocking.category" = "strict";
        "network.cookie.cookieBehavior" = 5;
        "privacy.query_stripping.enabled" = true;
        "privacy.query_stripping.enabled.pbmode" = true;
        "privacy.donottrackheader.enabled" = true;
        "privacy.donottrackheader.value" = 1;
        "privacy.globalprivacycontrol.enabled" = true;
        "privacy.partition.network_state" = true;

        "cookiebanners.service.mode" = 2;
        "cookiebanners.service.mode.privateBrowsing" = 2;

        "network.dns.disablePrefetch" = true;
        "network.prefetch-next" = false;
        "network.predictor.enabled" = false;
        "network.predictor.enable-prefetch" = false;
        "browser.send_pings" = false;
        "beacon.enabled" = false;
        "dom.event.clipboardevents.enabled" = false;

        "geo.enabled" = false;
        "permissions.default.geo" = 2;
        "permissions.default.camera" = 2;
        "permissions.default.microphone" = 2;
        "permissions.default.desktop-notification" = 2;
        "permissions.default.xr" = 2;

        "media.peerconnection.enabled" = false;
        "dom.battery.enabled" = false;
      };

      userChrome = ''
        /* Keep one usable bar while making the rest minimal and glassy. */
        #TabsToolbar,
        #PersonalToolbar,
        #sidebar-splitter,
        #sidebar-header {
          visibility: collapse !important;
        }

        #main-window,
        #browser,
        #appcontent,
        #tabbrowser-tabbox,
        #tabbrowser-tabpanels,
        browser[type="content-primary"] {
          background: transparent !important;
          background-image: none !important;
          box-shadow: none !important;
          border: none !important;
        }

        #navigator-toolbox,
        #nav-bar {
          background: rgba(0, 0, 0, 0.30) !important;
          background-image: none !important;
          border: none !important;
          box-shadow: none !important;
        }

        #urlbar-background,
        .searchbar-textbox {
          background: rgba(0, 0, 0, 0.45) !important;
          background-image: none !important;
          border: 1px solid rgba(255, 255, 255, 0.08) !important;
          box-shadow: none !important;
        }

        #urlbar[open] > #urlbar-background,
        #searchbar:focus-within {
          background: rgba(0, 0, 0, 0.62) !important;
        }

        :root {
          --toolbar-bgcolor: rgba(0, 0, 0, 0.18) !important;
          --lwt-accent-color: transparent !important;
          --lwt-header-image: none !important;
          --chrome-content-separator-color: transparent !important;
          --toolbar-field-background-color: rgba(0, 0, 0, 0.45) !important;
          --toolbar-field-border-color: rgba(255, 255, 255, 0.08) !important;
          --tabpanel-background-color: transparent !important;
          --newtab-background-color: transparent !important;
          color-scheme: dark !important;
        }
      '';

      userContent = ''
        /* about:* pages and Firefox internal surfaces */
        @-moz-document url("about:blank"),
                       url("about:home"),
                       url("about:newtab"),
                       url-prefix("about:preferences"),
                       url-prefix("about:config"),
                       url-prefix("about:addons") {
          :root {
            --in-content-page-background: transparent !important;
            --in-content-page-color: #d7eef7 !important;
            --in-content-box-background: rgba(0, 0, 0, 0.60) !important;
            --newtab-background-color: transparent !important;
            background: transparent !important;
            color-scheme: dark !important;
          }

          html,
          body {
            background: transparent !important;
            background-color: transparent !important;
            color: #d7eef7 !important;
          }
        }

        /* Base page background. This only affects page roots and elements that inherit. */
        @-moz-document url-prefix("http"),
                       url-prefix("https"),
                       url-prefix("file") {
          :root,
          html,
          body,
          body::before {
            background: rgba(0, 0, 0, 0.60) !important;
            background-color: rgba(0, 0, 0, 0.60) !important;
            background-image: none !important;
          }
        }

        /* DuckDuckGo */
        @-moz-document regexp("^https?://([a-z0-9-]+\\.)?duckduckgo\\.com/.*$") {
          :root,
          html,
          body,
          #__next,
          #react-layout,
          .site-wrapper,
          .header-wrap,
          .searchbox_homepage,
          .searchbox,
          .searchbox__input,
          .tile-wrap,
          .tag-home,
          .module--carousel,
          .results,
          .result,
          .result__body,
          .result__extras,
          .sidebar,
          .modal,
          .dropdown,
          .popover {
            background: rgba(0, 0, 0, 0.45) !important;
            background-color: rgba(0, 0, 0, 0.45) !important;
            background-image: none !important;
            box-shadow: none !important;
          }

          .searchbox__input,
          input,
          textarea {
            color: #d7eef7 !important;
            border-color: rgba(255, 255, 255, 0.10) !important;
          }
        }

        /* Google and Google Search */
        @-moz-document regexp("^https?://([a-z0-9-]+\\.)?google\\.[^/]+/.*$") {
          :root,
          html,
          body,
          #viewport,
          #main,
          #cnt,
          #rcnt,
          #center_col,
          #rhs,
          #searchform,
          #sform,
          #gb,
          #appbar,
          #search,
          #top_nav,
          #botstuff,
          #hdtb,
          #islrg,
          #rhsads,
          .sfbg,
          .minidiv,
          .appbar,
          .A8SBwf,
          .RNNXgb,
          .tF2Cxc,
          .MjjYud,
          .g,
          .kp-wholepage,
          .kp-header,
          .vk_c,
          .ULSxyf,
          .yg51vc,
          .o3j99,
          .aajZCb,
          .cEPPT,
          .XDyW0e,
          .sBbkle,
          c-wiz,
          form,
          header,
          section,
          article,
          main {
            background: rgba(0, 0, 0, 0.45) !important;
            background-color: rgba(0, 0, 0, 0.45) !important;
            background-image: none !important;
            box-shadow: none !important;
          }

          textarea,
          input,
          .gLFyf,
          .yAnwWd,
          .a4bIc,
          .RNNXgb {
            background: rgba(0, 0, 0, 0.35) !important;
            background-color: rgba(0, 0, 0, 0.35) !important;
            color: #d7eef7 !important;
            border-color: rgba(255, 255, 255, 0.10) !important;
            box-shadow: none !important;
          }
        }

        /* YouTube */
        @-moz-document regexp("^https?://([a-z0-9-]+\\.)?youtube\\.com/.*$") {
          :root {
            --yt-spec-base-background: rgba(0, 0, 0, 0.2) !important;
            --yt-spec-raised-background: rgba(0, 0, 0, 0.2) !important;
            --yt-spec-menu-background: rgba(0, 0, 0, 0.2) !important;
            --yt-spec-general-background-a: rgba(0, 0, 0, 0.2) !important;
            --yt-spec-general-background-b: rgba(0, 0, 0, 0.2) !important;
            --yt-spec-brand-background-primary: rgba(0, 0, 0, 0.2) !important;
            --yt-spec-brand-background-secondary: rgba(0, 0, 0, 0.2) !important;
          }

          html,
          body,
          ytd-app,
          #content,
          #page-manager,
          #columns,
          #primary,
          #secondary,
          #container,
          #chips-wrapper,
          #guide-content,
          #guide-inner-content,
          #masthead-container,
          #background,
          ytd-mini-guide-renderer,
          ytd-guide-renderer,
          ytd-rich-grid-renderer,
          ytd-rich-grid-row,
          ytd-rich-item-renderer,
          ytd-rich-section-renderer,
          ytd-two-column-browse-results-renderer,
          ytd-watch-flexy,
          ytd-watch-metadata,
          ytd-comments,
          ytd-comment-thread-renderer,
          ytd-playlist-panel-renderer,
          ytd-popup-container,
          tp-yt-paper-dialog,
          yt-chip-cloud-renderer,
          yt-chip-cloud-chip-renderer {
            background: rgba(0, 0, 0, 0.20) !important;
            background-color: rgba(0, 0, 0, 0.20) !important;
            background-image: none !important;
            box-shadow: none !important;
          }

          yt-searchbox,
          #search-form,
          #search-container,
          #search-icon-legacy,
          input#search {
            background: rgba(0, 0, 0, 0.20) !important;
            background-color: rgba(0, 0, 0, 0.35) !important;
            color: #d7eef7 !important;
            border-color: rgba(255, 255, 255, 0.10) !important;
          }
        }
      '';
    };
  };
}
