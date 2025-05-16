{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:

let
  mk = type: list: (lib.genAttrs list (n: (type + ".desktop")));
in

{
  environment.systemPackages = [ pkgs.ayugram-desktop ];
  hm = {
    xdg = {
      mimeApps.defaultApplications = (
        mk "com.ayugram.desktop.desktop" [
          "application/x-xdg-protocol-tg"
          "x-scheme-handler/tg"
        ]
      );

      dataFile = {
        "AyuGramDesktop/tdata/enhanced-settings-custom.json".text = builtins.toJSON {
          always_delete_for = 0;
          auto_unmute = false;
          bitrate = 0;
          blocked_user_spoiler_mode = false;
          disable_cloud_draft_sync = false;
          disable_global_search = false;
          disable_link_warning = true;
          disable_premium_animation = false;
          hd_video = false;
          hide_all_chats = true;
          hide_classic_fwd = true;
          hide_counter = false;
          hide_stories = false;
          net_dl_speed_boost = true;
          net_speed_boost = 0;
          radio_controller = "http//localhost2468";
          recent_display_limit = 0;
          repeater_reply_to_orig_msg = false;
          replace_edit_button = true;
          screenshot_mode = false;
          show_emoji_button_as_text = false;
          show_group_sender_avatar = false;
          show_messages_id = false;
          show_phone_number = false;
          show_repeater_option = false;
          show_scheduled_button = false;
          show_seconds = false;
          skip_to_next = true;
          stereo_mode = false;
          translate_to_tc = false;
        };

        "AyuGramDesktop/tdata/ayu_settings.json".text = builtins.toJSON {
          appIcon = "alt";
          channelBottomButton = 0;
          collapseSimilarChannels = true;
          deletedMark = "deleted";
          disableAds = true;
          disableCustomBackgrounds = true;
          disableNotificationsDelay = true;
          disableStories = false;
          editedMark = "edited";
          gifConfirmation = false;
          hideAllChatsFolder = true;
          hideFromBlocked = true;
          hideNotificationBadge = false;
          hideNotificationCounters = false;
          hideSimilarChannels = false;
          increaseWebviewHeight = true;
          increaseWebviewWidth = true;
          localPremium = true;
          markReadAfterAction = false;
          monoFont = config.stylix.fonts.monospace.name;
          recentStickersCount = 100;
          replaceBottomInfoWithIcons = true;
          saveDeletedMessages = false;
          saveForBots = false;
          saveMessagesHistory = true;
          sendOfflinePacketAfterOnline = false;
          sendOnlinePackets = true;
          sendReadMessages = true;
          sendReadStories = false;
          sendUploadProgress = true;
          sendWithoutSound = false;
          showAttachButtonInMessageField = true;
          showAttachPopup = true;
          showAutoDeleteButtonInMessageField = true;
          showCommandsButtonInMessageField = true;
          showEmojiButtonInMessageField = true;
          showEmojiPopup = true;
          showGhostToggleInDrawer = true;
          showGhostToggleInTray = true;
          showHideMessageInContextMenu = 0;
          showLReadToggleInDrawer = false;
          showMessageDetailsInContextMenu = 2;
          showMessageSeconds = false;
          showMessageShot = true;
          showMicrophoneButtonInMessageField = true;
          showPeerId = 2;
          showReactionsPanelInContextMenu = 1;
          showSReadToggleInDrawer = true;
          showStreamerToggleInDrawer = false;
          showStreamerToggleInTray = false;
          showUserMessagesInContextMenu = 2;
          showViewsPanelInContextMenu = 1;
          simpleQuotesAndReplies = true;
          spoofWebviewAsAndroid = false;
          stickerConfirmation = false;
          useScheduledMessages = false;
          voiceConfirmation = false;
          wideMultiplier = 1.0;
        };

        "AyuGramDesktop/tdata/shortcuts-custom.json".text =
          let
            mk = keys: command: { inherit command keys; };
            nk = mk null;
          in
          builtins.toJSON [
            (mk "alt+," "previous_folder")
            (mk "alt+." "next_folder")
            (mk "alt+a" "show_archive")
            (mk "alt+b" "folder4")
            (mk "alt+c" "folder2")
            (mk "alt+d" "self_chat")
            (mk "alt+f" "media_viewer_video_fullscreen")
            (mk "alt+g" "first_chat")
            (mk "alt+j" "next_chat")
            (mk "alt+k" "previous_chat")
            (mk "alt+m" "last_folder")
            (mk "alt+n" "folder5")
            (mk "alt+q" "close_telegram")
            (mk "alt+r" "read_chat")
            (mk "alt+s" "show_contacts")
            (mk "alt+v" "folder3")
            (mk "alt+x" "folder1")
            (mk "alt+z" "all_chats")
            (mk "alt+return" "message")
            (mk "alt+shift+" "media_previous")
            (mk "alt+shift+." "media_next")
            (mk "alt+shift+/" "media_playpause")
            (mk "alt+shift+1" "account1")
            (mk "alt+shift+2" "account2")
            (mk "alt+shift+3" "account3")
            (mk "alt+shift+4" "account4")
            (mk "alt+shift+5" "account5")
            (mk "alt+shift+6" "account6")
            (mk "alt+shift+a" "archive_chat")
            (mk "alt+shift+d" "show_chat_menu")
            (mk "alt+shift+g" "last_chat")
            (mk "alt+shift+q" "quit_telegram")
            (mk "alt+shift+s" "show_scheduled")
            (mk "alt+shift+return" "message_silently")
            (mk "ctrl+alt+return" "message_scheduled")
            (nk "media previous")
            (nk "media next")
            (nk "toggle media play/pause")
            (nk "ctrl+0")
            (nk "ctrl+1")
            (nk "ctrl+2")
            (nk "ctrl+3")
            (nk "ctrl+4")
            (nk "ctrl+5")
            (nk "ctrl+6")
            (nk "ctrl+7")
            (nk "ctrl+8")
            (nk "ctrl+9")
            (nk "ctrl+f")
            (nk "ctrl+j")
            (nk "ctrl+l")
            (nk "ctrl+m")
            (nk "ctrl+q")
            (nk "ctrl+r")
            (nk "ctrl+w")
            (nk "ctrl+\\")
            (nk "ctrl+tab")
            (nk "ctrl+backtab")
            (nk "ctrl+pgup")
            (nk "ctrl+pgdown")
            (nk "ctrl+f4")
            (nk "ctrl+shift+tab")
            (nk "ctrl+shift+up")
            (nk "ctrl+shift+down")
            (nk "alt+up")
            (nk "alt+down")
            (nk "ctrl+alt+home")
            (nk "ctrl+alt+end")
          ];
      };
    };

    home.activation =
      let
        walogram =
          with config.lib.stylix.colors.withHashtag;
          pkgs.writeShellApplication {
            name = "walogram";

            runtimeInputs = with pkgs; [
              imagemagick
              file
              zip
            ];

            bashOptions = [ "pipefail" ];

            text =
              let
                theme =
                  # css
                  ''
                    base00: ${base00};
                    base01: ${base01};
                    base02: ${base02};
                    base03: ${base03};
                    base04: ${base04};
                    base05: ${base05};
                    base06: ${base06};
                    base07: ${base07};
                    base08: ${base08};
                    base09: ${base09};
                    base0A: ${base0A};
                    base0B: ${base0B};
                    base0C: ${base0C};
                    base0D: ${base0D};
                    base0E: ${base0E};
                    base0F: ${base0F};

                    base00T: ${base00}cc;
                    base01T: ${base01}cc;
                    base02T: ${base02}cc;
                    base03T: ${base03}cc;
                    base04T: ${base04}cc;
                    base05T: ${base05}cc;
                    base06T: ${base06}cc;
                    base07T: ${base07}cc;
                    base08T: ${base08}cc;
                    base09T: ${base09}cc;
                    base0AT: ${base0A}cc;
                    base0BT: ${base0B}cc;
                    base0CT: ${base0C}cc;
                    base0DT: ${base0D}cc;
                    base0ET: ${base0E}cc;
                    base0FT: ${base0F}cc;

                    pBg: base00;
                    pSelection: base02;
                    pFg: base05;
                    pComment: base03;
                    pCyan: base0C;
                    pGreen: base0B;
                    pOrange: base09;
                    pPink: base0E;
                    pPurple: base0D;
                    pRed: base08;
                    pYellow: base0A;
                    pAnthracite: base03;
                    rippleBgHeavy: base00;
                    rippleBgLight: base01;
                    cBlack: base00;
                    cWhite: base05;
                    cTransparent: #00000000;

                    sideBarBg: pBg; // filters side bar background
                    sideBarBgActive: base01; // filters side bar active background
                    sideBarBgRipple: rippleBgLight; // filters side bar ripple effect
                    sideBarTextFg: base02; // filters side bar text
                    sideBarTextFgActive: pFg; // filters side bar active item text
                    sideBarIconFg: base02; // filters side bar icon
                    sideBarIconFgActive: pFg; // filters side bar active item icon
                    sideBarBadgeFg: pBg; // filters side bar badge background
                    sideBarBadgeBg: pPink; // filters side bar badge background
                    sideBarBadgeBgMuted: pComment; // filters side bar unimportant badge background
                    windowBg: pBg; // Main bg
                    windowFg: pFg; // Text color etc.
                    windowBgOver: rippleBgLight; // Generic bg hover color (random bits and pieces) & Search bar bg
                    windowBgRipple: rippleBgLight; // Ripple color (on hover colored items) [te]
                    windowFgOver: windowFg; // Text color on hover
                    windowSubTextFg: pComment; // Minor text and some labels (version number, last seen, etc.)
                    windowSubTextFgOver: pPurple; // Hotkey hover text color?
                    windowBoldFg: base05; // Bolded text (headers) [te]
                    windowBoldFgOver: windowBoldFg; // windowBoldFg but on hover (idk where used)
                    windowBgActive: pGreen; // Checked radio and checkbox color
                    windowFgActive: pBg; // Button Text [te]
                    windowActiveTextFg: pCyan; // Hyperlink text color (and text input active labels)
                    windowShadowFg: #000000f0; // [te]
                    windowShadowFgFallback: cBlack; // [te]
                    shadowFg: cTransparent; // [te]
                    slideFadeOutBg: windowBg; // ???
                    slideFadeOutShadowFg: cTransparent; // ??? [te]
                    imageBg: cBlack; // ???
                    imageBgTransparent: cWhite; // ???
                    activeButtonBg: pComment; // Raised Button bg
                    activeButtonBgOver: pPurple;  // Raised Button hover bg
                    activeButtonBgRipple: rippleBgHeavy; // Raised Button ripple color (and slected chat contact ripple?)
                    activeButtonFg: windowBg; // Raised Button text color
                    activeButtonFgOver: activeButtonFg; // Raised Button hover text color
                    activeButtonSecondaryFg: pFg; // Numbers (badges) text color on raised buttons
                    activeButtonSecondaryFgOver: activeButtonSecondaryFg; // activeButtonSecondaryFg on hover
                    activeLineFg: windowActiveTextFg; // Active text input bottom border color
                    activeLineFgError: pRed; // activeLineFg but on error
                    lightButtonBg: windowBg; // Flat button bg color
                    lightButtonBgOver: pSelection; // Flat button bg color on hover
                    lightButtonBgRipple: rippleBgLight; // Flat button ripple color
                    lightButtonFg: pComment; // Flat button text color [te]
                    lightButtonFgOver: activeButtonBgOver; // Flat button text color on hover
                    attentionButtonFg: pRed; // Warning button text color
                    attentionButtonFgOver: attentionButtonFg; // Warning button text color hover
                    attentionButtonBgOver: base08T; // Warning button bg color hover !!(pRed with transparency)!! [te]
                    attentionButtonBgRipple: rippleBgLight; // Warning button ripple color
                    // Outline buttons are flat btns that get a little indicator when hovered
                    outlineButtonBg: windowBg; // Outline Button bg
                    outlineButtonBgOver: pSelection; // Outline Button bg on hover [te]
                    outlineButtonOutlineFg: windowActiveTextFg; // Outline Button indicator color
                    outlineButtonBgRipple: rippleBgLight;  // Outline Button ripple color
                    menuBg: windowBg; // Menu bg color
                    menuBgOver: windowBgOver; // Menu bg color on hover
                    menuBgRipple: windowBgRipple; // Icon ripple color
                    // Menu Icons are icons that appear popup windows
                    menuIconFg: pComment; // Menu Icon text color
                    menuIconFgOver: pPurple; // Menu Icon text color on hover
                    menuSubmenuArrowFg: pComment; // ???
                    menuFgDisabled: pSelection; // Disabled menu text color
                    menuSeparatorFg: base06T; // [te]
                    scrollBarBg: pComment; // Scroll Bar current slider color (indicator)
                    scrollBarBgOver: pPurple; // Scroll Bar current slider color on hover
                    scrollBg: pSelection; // Scroll Bar track bg color
                    scrollBgOver: scrollBg; // Scroll Bar track bg color on hover
                    smallCloseIconFg: pComment; // Small menu close button color (its tiny)
                    smallCloseIconFgOver: pRed; // smallCloseIconFg on hover [te]
                    radialFg: pPink; // ??? [te]
                    radialBg: pSelection; // ??? [te]
                    placeholderFg: pSelection; //windowSubTextFg; [te]
                    placeholderFgActive: pComment;
                    inputBorderFg: pComment; // Input text field undeline when not active
                    filterInputBorderFg: pComment; // Search box active border
                    checkboxFg: pComment; // checkbox inactive border [te]
                    sliderBgInactive: pSelection; // windowBgActive;
                    sliderBgActive: pGreen; // A slider is the bottom border on tabs that slides around
                    tooltipBg: base01T; // [te]
                    tooltipFg: pFg; // [te]
                    tooltipBorderFg: cTransparent; // [te]
                    titleBg: pBg; // Window top bar bg color
                    titleShadow: cTransparent;
                    titleButtonFg: pSelection; // [te]
                    titleButtonBgOver: cTransparent; // ??? [te]
                    titleButtonFgOver: pOrange; // ??? [te]
                    titleButtonCloseBgOver: cTransparent; // ??? [te]
                    titleButtonCloseFgOver: pRed; // ??? [te]
                    titleFgActive: pPurple; // Window Title color when active [te]
                    titleFg: pComment; // Window Title color
                    trayCounterBg: pRed; // Tray icon counter background for unread messages
                    trayCounterBgMute: pBg; // ??? [te]
                    trayCounterFg: pFg; // ??? [te]
                    trayCounterBgMacInvert: pComment; // ??? [te]
                    trayCounterFgMacInvert: pFg; // ??? [te]
                    layerBg: base01T; // bg overlay when menu is up [te]
                    cancelIconFg: menuIconFg; // Main close menu color (like option close)
                    cancelIconFgOver: pRed; // & on hover [te]
                    boxBg: windowBg;
                    boxTextFg: windowFg;
                    boxTextFgGood: pGreen;
                    boxTextFgError: pRed;
                    boxTitleFg: cWhite;
                    boxSearchBg: boxBg;
                    boxSearchCancelIconFg: cancelIconFg;
                    boxSearchCancelIconFgOver: cancelIconFgOver;
                    boxTitleAdditionalFg: pCyan; // [te]
                    boxTitleCloseFg: cancelIconFg;
                    boxTitleCloseFgOver: cancelIconFgOver;
                    membersAboutLimitFg: pRed; // [te]
                    contactsBg: windowBg; // Contact bg color on contacts page
                    contactsBgOver: windowBgOver;
                    contactsNameFg: base05; // Contact name color on contacts page [te]
                    contactsStatusFg: windowSubTextFg; // Contact status color on contacts page
                    contactsStatusFgOver: base04;
                    contactsStatusFgOnline: windowActiveTextFg;
                    photoCropFadeBg: layerBg;
                    photoCropPointFg: pComment;
                    introBg: windowBg;
                    introTitleFg: windowBoldFg;
                    introDescriptionFg: windowSubTextFg;
                    introErrorFg: pRed; // [te]
                    introCoverTopBg: pBg; // [te]
                    introCoverBottomBg: pBg; // [te]
                    introCoverIconsFg: pComment; // [te]
                    introCoverPlaneTrace: pCyan; // [te]
                    introCoverPlaneInner: pCyan; // [te]
                    introCoverPlaneOuter: pCyan; // [te]
                    introCoverPlaneTop: pCyan; // [te]
                    dialogsMenuIconFg: menuIconFg; // menu hamburger color
                    dialogsMenuIconFgOver: menuIconFgOver;
                    dialogsBg: windowBg;
                    dialogsNameFg: base05; // Chat names color
                    dialogsChatIconFg: pOrange; // [te]
                    dialogsDateFg: windowSubTextFg;
                    dialogsTextFg: windowSubTextFg;
                    dialogsTextFgService: base0E;
                    dialogsDraftFg: pRed; // Draft label color
                    dialogsVerifiedIconBg: pCyan; // verified icon bg [te]
                    dialogsVerifiedIconFg: pBg; // verified icon text color [te]
                    dialogsSendingIconFg: pOrange; // ??? little clock icon on chat contact (the ones on left sidebar) when sending
                    dialogsSentIconFg: pGreen;
                    dialogsUnreadBg: pComment; // [te]
                    dialogsUnreadBgMuted: pSelection; // [te]
                    dialogsUnreadFg: pFg; // [te]
                    dialogsBgOver: windowBgOver;
                    dialogsNameFgOver: windowBoldFgOver;
                    dialogsChatIconFgOver: dialogsChatIconFg;
                    dialogsDateFgOver: windowSubTextFgOver;
                    dialogsTextFgOver: windowSubTextFgOver;
                    dialogsTextFgServiceOver: dialogsTextFgService;
                    dialogsDraftFgOver: dialogsDraftFg;
                    dialogsVerifiedIconBgOver: dialogsVerifiedIconBg;
                    dialogsVerifiedIconFgOver: dialogsVerifiedIconFg;
                    dialogsSendingIconFgOver: dialogsSendingIconFg;
                    dialogsSentIconFgOver: dialogsSentIconFg;
                    dialogsUnreadBgOver: dialogsUnreadBg;
                    dialogsUnreadBgMutedOver: dialogsUnreadBgMuted;
                    dialogsUnreadFgOver: dialogsUnreadFg;
                    dialogsBgActive: pSelection;
                    dialogsNameFgActive: pPink;
                    dialogsChatIconFgActive: pPurple;
                    dialogsDateFgActive: base04;
                    dialogsTextFgActive: base04;
                    dialogsTextFgServiceActive: pOrange; // [te]
                    dialogsDraftFgActive: dialogsDraftFg;
                    dialogsVerifiedIconBgActive: dialogsVerifiedIconBg;
                    dialogsVerifiedIconFgActive: dialogsVerifiedIconFg;
                    dialogsSendingIconFgActive: dialogsSendingIconFg;
                    dialogsSentIconFgActive: dialogsSentIconFg;
                    dialogsUnreadBgActive: dialogsUnreadBg;
                    dialogsUnreadBgMutedActive: dialogsUnreadBgMuted;
                    dialogsUnreadFgActive: dialogsUnreadFg;
                    dialogsForwardBg: dialogsBgActive;
                    dialogsForwardFg: pCyan; // [te]
                    searchedBarBg: pBg; // Results & 'no msgs found' msg in search results [te]
                    searchedBarBorder: cTransparent; // [te]
                    searchedBarFg: base05; // Text 'Search for messages' in search results. [te]
                    topBarBg: windowBg;
                    emojiPanBg: windowBg; // Emoji window bg
                    emojiPanCategories: emojiPanBg;
                    emojiPanHeaderFg: windowSubTextFg;
                    emojiPanHeaderBg: emojiPanBg;
                    stickerPanDeleteBg: base08T; // [te]
                    stickerPanDeleteFg: pRed; // windowFgActive; [te]
                    stickerPreviewBg: cTransparent;
                    historyTextInFg: windowFg;
                    historyTextOutFg: windowFg;
                    historyCaptionInFg: historyTextInFg;
                    historyCaptionOutFg: historyTextOutFg;
                    historyFileNameInFg: historyTextInFg;
                    historyFileNameOutFg: historyTextOutFg;
                    historyOutIconFg: pGreen;
                    historyOutIconFgSelected: pGreen;
                    historyIconFgInverted: pGreen; // [te]
                    historySendingOutIconFg: pOrange; // [te]
                    historySendingInIconFg: pOrange; // [te]
                    historySendingInvertedIconFg: pOrange; // little 'eye' icon on some media msgs (ie sticker, image) to indicate views? [te]
                    historySystemBg: pYellow; // [te]
                    historySystemBgSelected: pOrange; // [te]
                    historySystemFg: pBg; // windowFgActive; [te]
                    historyUnreadBarBg: pSelection;
                    historyUnreadBarBorder: pSelection;
                    historyUnreadBarFg: cWhite;
                    historyForwardChooseBg: pComment;
                    historyForwardChooseFg: cWhite;
                    historyPeer1NameFg: pRed; // [te]
                    historyPeer1UserpicBg: pRed; // [te]
                    historyPeer2NameFg: pGreen; // [te]
                    historyPeer2UserpicBg: pGreen; // [te]
                    historyPeer3NameFg: pYellow; // [te]
                    historyPeer3UserpicBg: pYellow; // [te]
                    historyPeer4NameFg: pCyan; // [te]
                    historyPeer4UserpicBg: pCyan; // [te]
                    historyPeer5NameFg: pPurple; // [te]
                    historyPeer5UserpicBg: pPurple; // [te]
                    historyPeer6NameFg: pPink; // [te]
                    historyPeer6UserpicBg: pPink; // [te]
                    historyPeer7NameFg: pAnthracite; // [te]
                    historyPeer7UserpicBg: pAnthracite; // [te]
                    historyPeer8NameFg: pOrange; // [te]
                    historyPeer8UserpicBg: pOrange; // [te]
                    historyPeerUserpicFg: pBg; //  [te]
                    historyScrollBarBg: scrollBarBg;
                    historyScrollBarBgOver: scrollBarBgOver;
                    historyScrollBg: scrollBg;
                    historyScrollBgOver: scrollBgOver;
                    msgInBg: base01;
                    msgInBgSelected: base02;
                    msgOutBg: base01;
                    msgOutBgSelected: base02;
                    msgSelectOverlay: base01T;
                    msgStickerOverlay: rippleBgHeavy;
                    msgInServiceFg: windowActiveTextFg; // Chat name color when system message in (ie the computer... Forwarded by, Channels, etc)
                    msgInServiceFgSelected: windowActiveTextFg; // msgInServiceFg when selected
                    msgOutServiceFg: windowActiveTextFg; // msgInServiceFg but out instead
                    msgOutServiceFgSelected: windowActiveTextFg; // msgOutServiceFg when selected
                    msgInShadow: cTransparent;
                    msgInShadowSelected: cTransparent;
                    msgOutShadow: cTransparent;
                    msgOutShadowSelected: cTransparent;
                    msgInDateFg: base05; // Date in IN msg (text color) [ie time recieved] [te]
                    msgInDateFgSelected: base04; // msgInDateFG but when msg is selected [te]
                    msgOutDateFg: base05; // Date in OUT msg (text color) [ie time sent] [te]
                    msgOutDateFgSelected: base04; // msgOutDateFG but when msg is selected [te]
                    msgServiceFg: base05; // [te]
                    msgServiceBg: base01T; // Sticker reply, dates in chat history, bot buttons [te]
                    msgServiceBgSelected: base0ET; // [te]
                    msgInReplyBarColor: activeLineFg;
                    msgInReplyBarSelColor: activeLineFg;
                    msgOutReplyBarColor: activeLineFg;
                    msgOutReplyBarSelColor: activeLineFg;
                    msgImgReplyBarColor: activeLineFg;
                    msgInMonoFg: pOrange; // [te]
                    msgOutMonoFg: pOrange; // [te]
                    msgDateImgFg: windowFg;
                    msgDateImgBg: windowBg;
                    msgDateImgBgOver: windowBgOver;
                    msgDateImgBgSelected: windowBgOver;
                    msgFileThumbLinkInFg: pYellow; // [te]
                    msgFileThumbLinkInFgSelected: pComment; // [te]
                    msgFileThumbLinkOutFg: pYellow; // [te]
                    msgFileThumbLinkOutFgSelected: pComment; // [te]
                    msgFileInBg: pPink; // [te]
                    msgFileInBgOver: pFg; // [te]
                    msgFileInBgSelected: pComment; // [te]
                    msgFileOutBg: base0D; // [te]
                    msgFileOutBgOver: pFg; // [te]
                    msgFileOutBgSelected: pSelection; //  [te]
                    msgFile1Bg: pCyan; // [te]
                    msgFile1BgDark: base0D; // [te]
                    msgFile1BgOver: base0D; // [te]
                    msgFile1BgSelected: base0D; // [te]
                    msgFile2Bg: pGreen; // [te]
                    msgFile2BgDark: base0B; // [te]
                    msgFile2BgOver: base0B; // [te]
                    msgFile2BgSelected: base0B; // [te]
                    msgFile3Bg: pRed; // [te]
                    msgFile3BgDark: base08; // [te]
                    msgFile3BgOver: base08; // [te]
                    msgFile3BgSelected: base08; // [te]
                    msgFile4Bg: pYellow; // [te]
                    msgFile4BgDark: base0A; // [te]
                    msgFile4BgOver: base0A; // [te]
                    msgFile4BgSelected: base0A; // [te]
                    msgWaveformInActive: pGreen; // Waveforms for audio messages (active is the played part)
                    msgWaveformInActiveSelected: pGreen;
                    msgWaveformInInactive: windowBg;
                    msgWaveformInInactiveSelected: windowBg;
                    msgWaveformOutActive: pGreen;
                    msgWaveformOutActiveSelected: pGreen;
                    msgWaveformOutInactive: windowBg;
                    msgWaveformOutInactiveSelected: windowBg;
                    msgBotKbOverBgAdd: rippleBgLight; // [te]
                    msgBotKbIconFg: pBg; //  [te]
                    msgBotKbRippleBg: activeButtonBgRipple; //menuBgRipple; // Bot (system) chat buttons [ie theme like/dislike]
                    mediaInFg: pOrange; // [te]
                    mediaInFgSelected: pOrange; // [te]
                    mediaOutFg: pOrange; // [te]
                    mediaOutFgSelected: pOrange; // [te]
                    youtubePlayIconBg: pRed;
                    youtubePlayIconFg: pFg;
                    videoPlayIconBg: pComment; // [te]
                    videoPlayIconFg: pFg; // [te]
                    toastBg: pComment; // [te]
                    toastFg: cWhite;
                    reportSpamBg: emojiPanHeaderBg;
                    reportSpamFg: windowFg;
                    historyToDownShadow: cTransparent;
                    historyComposeAreaBg: windowBg;
                    historyComposeAreaFg: historyTextInFg;
                    historyComposeAreaFgService: pFg; // [te]
                    historyComposeIconFg: menuIconFg; // Bottom chat icons (Attach File, Emoji, Microphone)
                    historyComposeIconFgOver: menuIconFgOver;
                    historySendIconFg: menuIconFg; // Paper plane icon that shows when text is typed (click to send)
                    historySendIconFgOver: pGreen; // [te]
                    historyPinnedBg: windowBg;
                    historyReplyBg: historyComposeAreaBg;
                    historyReplyCancelFg: cancelIconFg;
                    historyReplyCancelFgOver: pRed; // [te]
                    historyComposeButtonBg: historyComposeAreaBg;
                    historyComposeButtonBgOver: windowBgOver;
                    historyComposeButtonBgRipple: windowBgRipple;
                    overviewCheckBg: cTransparent; // [te]
                    overviewCheckFg: windowBg;
                    overviewCheckFgActive: windowBg;
                    overviewPhotoSelectOverlay: rippleBgHeavy; // [te]
                    profileStatusFgOver: pPurple;
                    notificationsBoxMonitorFg: windowFg;
                    notificationsBoxScreenBg: pSelection; // [te]
                    notificationSampleUserpicFg:  pCyan; // [te]
                    notificationSampleCloseFg: pRed; // [te]
                    notificationSampleTextFg: pFg; // [te]
                    notificationSampleNameFg: pYellow; // [te]
                    mainMenuBg: windowBg;
                    mainMenuCoverBg: pSelection; // [te]
                    mainMenuCoverFg:  pGreen; // [te]
                    mediaPlayerBg:  pBg; //  [te]
                    mediaPlayerActiveFg: pGreen; // [te]
                    mediaPlayerInactiveFg: pComment; // [te]
                    mediaPlayerDisabledFg: pSelection; // [te]
                    mediaviewFileBg: pSelection; //  [te]
                    mediaviewFileNameFg: windowFg;
                    mediaviewFileSizeFg: pOrange; //windowSubTextFg; [te]
                    mediaviewFileRedCornerFg: base08; // [te]
                    mediaviewFileYellowCornerFg: base0A; // [te]
                    mediaviewFileGreenCornerFg: base0B; // [te]
                    mediaviewFileBlueCornerFg: base0D; // [te]
                    mediaviewFileExtFg: pBg; // [te]
                    mediaviewMenuBg: pBg; // [te]
                    mediaviewMenuBgOver: pSelection; // [te]
                    mediaviewMenuBgRipple: rippleBgLight; // [te]
                    mediaviewMenuFg: base0F; // windowFgActive; [te]
                    mediaviewBg: #000000cc; // [te]
                    mediaviewVideoBg:  #000000;
                    mediaviewControlBg: pBg; //  [te]
                    mediaviewControlFg: base05; // windowFgActive; [te]
                    mediaviewCaptionBg: pBg; //  [te]
                    mediaviewCaptionFg: cWhite;
                    mediaviewTextLinkFg: pCyan; // [te]
                    mediaviewSaveMsgBg: toastBg;
                    mediaviewSaveMsgFg: toastFg;
                    mediaviewPlaybackActive: pGreen; // [te]
                    mediaviewPlaybackInactive: pSelection; //windowSubTextFg; [te]
                    mediaviewPlaybackActiveOver: pGreen; // [te]
                    mediaviewPlaybackInactiveOver: pComment; //windowSubTextFgOver; [te]
                    mediaviewPlaybackProgressFg: pFg; // [te]
                    mediaviewPlaybackIconFg: base04; // [te]
                    mediaviewPlaybackIconFgOver: mediaviewPlaybackActiveOver;
                    mediaviewTransparentBg: cBlack; // [te]
                    mediaviewTransparentFg: base03; // [te]
                    notificationBg: windowBg;
                    titleButtonBg: cTransparent; // [te]
                    titleButtonBgActive: cTransparent; // [te]
                    titleButtonBgActiveOver: pSelection; // [te]
                    titleButtonFgActiveOver: pOrange; // [te]
                    titleButtonFgActive: pOrange; // [te]
                    titleButtonCloseBg: cTransparent; // [te]
                    titleButtonCloseFg: pSelection; // [te]
                    titleButtonCloseBgActive: cTransparent; // [te]
                    titleButtonCloseFgActive: pRed; // [te]
                    titleButtonCloseBgActiveOver: pSelection; // [te]
                    titleButtonCloseFgActiveOver: titleButtonCloseFgOver;
                    filterInputInactiveBg: base01T; // [te]
                    profileVerifiedCheckBg: pCyan; // [te]
                    historyReplyIconFg: windowBgActive;
                    historyToDownBg: base01; // [te]
                    titleBgActive: pBg; //  [te]
                  '';
              in
              # sh
              ''
                # variables
                tempdir="$(mktemp -d)"
                cachedir="${config.hm.xdg.cacheHome}/stylix-telegram-theme"
                themename="stylix.tdesktop-theme"
                walmode="solid"
                walname="background.jpg"
                blur="true"
                # mkdir 
                mkdir -p "$cachedir"
                echo "${theme}" > "$tempdir/colors.tdesktop-theme"
                gentheme() {
                  if command -v zip >/dev/null 2>&1; then
                    if [ "$walmode" = "solid" ]; then
                      magick -size 256x256 "gradient:${base01}-${base00}" "$tempdir/$walname"
                    else
                      case "$(file -b --mime-type "${config.stylix.image}")" in
                      image/*) convert ''${blur:+-blur 0x32} -resize 1920x1080 "${config.stylix.image}" "$tempdir/$walname" ;;
                      *) echo "not an image: ${config.stylix.image}" ;;
                      esac
                    fi
                    zip -jq -FS "$cachedir/$themename" "$tempdir"/*
                  else
                    msg "'zip' not found. theme generated without background image"
                    cp -f "$tempdir/colors.tdesktop-theme" "$cachedir/$themename"
                  fi
                }
                gentheme
              '';

          };
      in
      {
        telegramTheme =
          inputs.home.lib.hm.dag.entryAfter [ "" ]
            # sh
            ("run " + lib.getExe walogram);
      };
  };
}
