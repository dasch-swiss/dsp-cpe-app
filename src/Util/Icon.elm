module Util.Icon exposing (..)

import Heroicons.Solid
import Html exposing (Html)


type Icon
    = AcademicCap
    | Adjustments
    | Annotation
    | Archive
    | ArrowCircleDown
    | ArrowCircleLeft
    | ArrowCircleRight
    | ArrowCircleUp
    | ArrowDown
    | ArrowLeft
    | ArrowNarrowDown
    | ArrowNarrowLeft
    | ArrowNarrowRight
    | ArrowNarrowUp
    | ArrowRight
    | ArrowUp
    | ArrowsExpand
    | AtSymbol
    | Backspace
    | BadgeCheck
    | Ban
    | Beaker
    | Bell
    | BookOpen
    | BookmarkAlt
    | Bookmark
    | Briefcase
    | Cake
    | Calculator
    | Calendar
    | Camera
    | Cash
    | ChartBar
    | ChartPie
    | ChartSquareBar
    | ChatAlt2
    | ChatAlt
    | Chat
    | CheckCircle
    | Check
    | ChevronDoubleDown
    | ChevronDoubleLeft
    | ChevronDoubleRight
    | ChevronDoubleUp
    | ChevronDown
    | ChevronLeft
    | ChevronRight
    | ChevronUp
    | Chip
    | ClipboardCheck
    | ClipboardCopy
    | ClipboardList
    | Clipboard
    | Clock
    | CloudDownload
    | CloudUpload
    | Cloud
    | Code
    | Cog
    | Collection
    | ColorSwatch
    | CreditCard
    | CubeTransparent
    | Cube
    | CurrencyBangladeshi
    | CurrencyDollar
    | CurrencyEuro
    | CurrencyPound
    | CurrencyRupee
    | CurrencyYen
    | CursorClick
    | Database
    | DesktopComputer
    | DeviceMobile
    | DeviceTablet
    | DocumentAdd
    | DocumentDownload
    | DocumentDuplicate
    | DocumentRemove
    | DocumentReport
    | DocumentSearch
    | DocumentText
    | Document
    | DotsCircleHorizontal
    | DotsHorizontal
    | DotsVertical
    | Download
    | Duplicate
    | EmojiHappy
    | EmojiSad
    | ExclamationCircle
    | Exclamation
    | ExternalLink
    | EyeOff
    | Eye
    | FastForward
    | Film
    | Filter
    | FingerPrint
    | Fire
    | Flag
    | FolderAdd
    | FolderDownload
    | FolderOpen
    | FolderRemove
    | Folder
    | Gift
    | GlobeAlt
    | Globe
    | Hand
    | Hashtag
    | Heart
    | Home
    | Identification
    | InboxIn
    | Inbox
    | InformationCircle
    | Key
    | Library
    | LightBulb
    | LightningBolt
    | Link
    | LocationMarker
    | LockClosed
    | LockOpen
    | Login
    | Logout
    | MailOpen
    | Mail
    | Map
    | MenuAlt1
    | MenuAlt2
    | MenuAlt3
    | MenuAlt4
    | Menu
    | Microphone
    | MinusCircle
    | MinusSm
    | Minus
    | Moon
    | MusicNote
    | Newspaper
    | OfficeBuilding
    | PaperAirplane
    | PaperClip
    | Pause
    | PencilAlt
    | Pencil
    | PhoneIncoming
    | PhoneMissedCall
    | PhoneOutgoing
    | Phone
    | Photograph
    | Play
    | PlusCircle
    | PlusSm
    | Plus
    | PresentationChartBar
    | PresentationChartLine
    | Printer
    | Puzzle
    | Qrcode
    | QuestionMarkCircle
    | ReceiptRefund
    | ReceiptTax
    | Refresh
    | Reply
    | Rewind
    | Rss
    | SaveAs
    | Save
    | Scale
    | Scissors
    | SearchCircle
    | Search
    | Selector
    | Server
    | Share
    | ShieldCheck
    | ShieldExclamation
    | ShoppingBag
    | ShoppingCart
    | SortAscending
    | SortDescending
    | Sparkles
    | Speakerphone
    | Star
    | StatusOffline
    | StatusOnline
    | Stop
    | Sun
    | Support
    | SwitchHorizontal
    | SwitchVertical
    | Table
    | Tag
    | Template
    | Terminal
    | ThumbDown
    | ThumbUp
    | Ticket
    | Translate
    | Trash
    | TrendingDown
    | TrendingUp
    | Truck
    | Upload
    | UserAdd
    | UserCircle
    | UserGroup
    | UserRemove
    | User
    | Users
    | Variable
    | VideoCamera
    | ViewBoards
    | ViewGridAdd
    | ViewGrid
    | ViewList
    | VolumeOff
    | VolumeUp
    | Wifi
    | XCircle
    | X
    | ZoomIn
    | ZoomOut


getHtml : Icon -> Html msg
getHtml icon =
    case icon of
        AcademicCap ->
            Heroicons.Solid.academicCap []

        Adjustments ->
            Heroicons.Solid.adjustments []

        Annotation ->
            Heroicons.Solid.annotation []

        Archive ->
            Heroicons.Solid.archive []

        ArrowCircleDown ->
            Heroicons.Solid.arrowCircleDown []

        ArrowCircleLeft ->
            Heroicons.Solid.arrowCircleLeft []

        ArrowCircleRight ->
            Heroicons.Solid.arrowCircleRight []

        ArrowCircleUp ->
            Heroicons.Solid.arrowCircleUp []

        ArrowDown ->
            Heroicons.Solid.arrowDown []

        ArrowLeft ->
            Heroicons.Solid.arrowLeft []

        ArrowNarrowDown ->
            Heroicons.Solid.arrowNarrowDown []

        ArrowNarrowLeft ->
            Heroicons.Solid.arrowNarrowLeft []

        ArrowNarrowRight ->
            Heroicons.Solid.arrowNarrowRight []

        ArrowNarrowUp ->
            Heroicons.Solid.arrowNarrowUp []

        ArrowRight ->
            Heroicons.Solid.arrowRight []

        ArrowUp ->
            Heroicons.Solid.arrowUp []

        ArrowsExpand ->
            Heroicons.Solid.arrowsExpand []

        AtSymbol ->
            Heroicons.Solid.atSymbol []

        Backspace ->
            Heroicons.Solid.backspace []

        BadgeCheck ->
            Heroicons.Solid.badgeCheck []

        Ban ->
            Heroicons.Solid.ban []

        Beaker ->
            Heroicons.Solid.beaker []

        Bell ->
            Heroicons.Solid.bell []

        BookOpen ->
            Heroicons.Solid.bookOpen []

        BookmarkAlt ->
            Heroicons.Solid.bookmarkAlt []

        Bookmark ->
            Heroicons.Solid.bookmark []

        Briefcase ->
            Heroicons.Solid.briefcase []

        Cake ->
            Heroicons.Solid.cake []

        Calculator ->
            Heroicons.Solid.calculator []

        Calendar ->
            Heroicons.Solid.calendar []

        Camera ->
            Heroicons.Solid.camera []

        Cash ->
            Heroicons.Solid.cash []

        ChartBar ->
            Heroicons.Solid.chartBar []

        ChartPie ->
            Heroicons.Solid.chartPie []

        ChartSquareBar ->
            Heroicons.Solid.chartSquareBar []

        ChatAlt2 ->
            Heroicons.Solid.chatAlt2 []

        ChatAlt ->
            Heroicons.Solid.chatAlt []

        Chat ->
            Heroicons.Solid.chat []

        CheckCircle ->
            Heroicons.Solid.checkCircle []

        Check ->
            Heroicons.Solid.check []

        ChevronDoubleDown ->
            Heroicons.Solid.chevronDoubleDown []

        ChevronDoubleLeft ->
            Heroicons.Solid.chevronDoubleLeft []

        ChevronDoubleRight ->
            Heroicons.Solid.chevronDoubleRight []

        ChevronDoubleUp ->
            Heroicons.Solid.chevronDoubleUp []

        ChevronDown ->
            Heroicons.Solid.chevronDown []

        ChevronLeft ->
            Heroicons.Solid.chevronLeft []

        ChevronRight ->
            Heroicons.Solid.chevronRight []

        ChevronUp ->
            Heroicons.Solid.chevronUp []

        Chip ->
            Heroicons.Solid.chip []

        ClipboardCheck ->
            Heroicons.Solid.clipboardCheck []

        ClipboardCopy ->
            Heroicons.Solid.clipboardCopy []

        ClipboardList ->
            Heroicons.Solid.clipboardList []

        Clipboard ->
            Heroicons.Solid.clipboard []

        Clock ->
            Heroicons.Solid.clock []

        CloudDownload ->
            Heroicons.Solid.cloudDownload []

        CloudUpload ->
            Heroicons.Solid.cloudUpload []

        Cloud ->
            Heroicons.Solid.cloud []

        Code ->
            Heroicons.Solid.code []

        Cog ->
            Heroicons.Solid.cog []

        Collection ->
            Heroicons.Solid.collection []

        ColorSwatch ->
            Heroicons.Solid.colorSwatch []

        CreditCard ->
            Heroicons.Solid.creditCard []

        CubeTransparent ->
            Heroicons.Solid.cubeTransparent []

        Cube ->
            Heroicons.Solid.cube []

        CurrencyBangladeshi ->
            Heroicons.Solid.currencyBangladeshi []

        CurrencyDollar ->
            Heroicons.Solid.currencyDollar []

        CurrencyEuro ->
            Heroicons.Solid.currencyEuro []

        CurrencyPound ->
            Heroicons.Solid.currencyPound []

        CurrencyRupee ->
            Heroicons.Solid.currencyRupee []

        CurrencyYen ->
            Heroicons.Solid.currencyYen []

        CursorClick ->
            Heroicons.Solid.cursorClick []

        Database ->
            Heroicons.Solid.database []

        DesktopComputer ->
            Heroicons.Solid.desktopComputer []

        DeviceMobile ->
            Heroicons.Solid.deviceMobile []

        DeviceTablet ->
            Heroicons.Solid.deviceTablet []

        DocumentAdd ->
            Heroicons.Solid.documentAdd []

        DocumentDownload ->
            Heroicons.Solid.documentDownload []

        DocumentDuplicate ->
            Heroicons.Solid.documentDuplicate []

        DocumentRemove ->
            Heroicons.Solid.documentRemove []

        DocumentReport ->
            Heroicons.Solid.documentReport []

        DocumentSearch ->
            Heroicons.Solid.documentSearch []

        DocumentText ->
            Heroicons.Solid.documentText []

        Document ->
            Heroicons.Solid.document []

        DotsCircleHorizontal ->
            Heroicons.Solid.dotsCircleHorizontal []

        DotsHorizontal ->
            Heroicons.Solid.dotsHorizontal []

        DotsVertical ->
            Heroicons.Solid.dotsVertical []

        Download ->
            Heroicons.Solid.download []

        Duplicate ->
            Heroicons.Solid.duplicate []

        EmojiHappy ->
            Heroicons.Solid.emojiHappy []

        EmojiSad ->
            Heroicons.Solid.emojiSad []

        ExclamationCircle ->
            Heroicons.Solid.exclamationCircle []

        Exclamation ->
            Heroicons.Solid.exclamation []

        ExternalLink ->
            Heroicons.Solid.externalLink []

        EyeOff ->
            Heroicons.Solid.eyeOff []

        Eye ->
            Heroicons.Solid.eye []

        FastForward ->
            Heroicons.Solid.fastForward []

        Film ->
            Heroicons.Solid.film []

        Filter ->
            Heroicons.Solid.filter []

        FingerPrint ->
            Heroicons.Solid.fingerPrint []

        Fire ->
            Heroicons.Solid.fire []

        Flag ->
            Heroicons.Solid.flag []

        FolderAdd ->
            Heroicons.Solid.folderAdd []

        FolderDownload ->
            Heroicons.Solid.folderDownload []

        FolderOpen ->
            Heroicons.Solid.folderOpen []

        FolderRemove ->
            Heroicons.Solid.folderRemove []

        Folder ->
            Heroicons.Solid.folder []

        Gift ->
            Heroicons.Solid.gift []

        GlobeAlt ->
            Heroicons.Solid.globeAlt []

        Globe ->
            Heroicons.Solid.globe []

        Hand ->
            Heroicons.Solid.hand []

        Hashtag ->
            Heroicons.Solid.hashtag []

        Heart ->
            Heroicons.Solid.heart []

        Home ->
            Heroicons.Solid.home []

        Identification ->
            Heroicons.Solid.identification []

        InboxIn ->
            Heroicons.Solid.inboxIn []

        Inbox ->
            Heroicons.Solid.inbox []

        InformationCircle ->
            Heroicons.Solid.informationCircle []

        Key ->
            Heroicons.Solid.key []

        Library ->
            Heroicons.Solid.library []

        LightBulb ->
            Heroicons.Solid.lightBulb []

        LightningBolt ->
            Heroicons.Solid.lightningBolt []

        Link ->
            Heroicons.Solid.link []

        LocationMarker ->
            Heroicons.Solid.locationMarker []

        LockClosed ->
            Heroicons.Solid.lockClosed []

        LockOpen ->
            Heroicons.Solid.lockOpen []

        Login ->
            Heroicons.Solid.login []

        Logout ->
            Heroicons.Solid.logout []

        MailOpen ->
            Heroicons.Solid.mailOpen []

        Mail ->
            Heroicons.Solid.mail []

        Map ->
            Heroicons.Solid.map []

        MenuAlt1 ->
            Heroicons.Solid.menuAlt1 []

        MenuAlt2 ->
            Heroicons.Solid.menuAlt2 []

        MenuAlt3 ->
            Heroicons.Solid.menuAlt3 []

        MenuAlt4 ->
            Heroicons.Solid.menuAlt4 []

        Menu ->
            Heroicons.Solid.menu []

        Microphone ->
            Heroicons.Solid.microphone []

        MinusCircle ->
            Heroicons.Solid.minusCircle []

        MinusSm ->
            Heroicons.Solid.minusSm []

        Minus ->
            Heroicons.Solid.minus []

        Moon ->
            Heroicons.Solid.moon []

        MusicNote ->
            Heroicons.Solid.musicNote []

        Newspaper ->
            Heroicons.Solid.newspaper []

        OfficeBuilding ->
            Heroicons.Solid.officeBuilding []

        PaperAirplane ->
            Heroicons.Solid.paperAirplane []

        PaperClip ->
            Heroicons.Solid.paperClip []

        Pause ->
            Heroicons.Solid.pause []

        PencilAlt ->
            Heroicons.Solid.pencilAlt []

        Pencil ->
            Heroicons.Solid.pencil []

        PhoneIncoming ->
            Heroicons.Solid.phoneIncoming []

        PhoneMissedCall ->
            Heroicons.Solid.phoneMissedCall []

        PhoneOutgoing ->
            Heroicons.Solid.phoneOutgoing []

        Phone ->
            Heroicons.Solid.phone []

        Photograph ->
            Heroicons.Solid.photograph []

        Play ->
            Heroicons.Solid.play []

        PlusCircle ->
            Heroicons.Solid.plusCircle []

        PlusSm ->
            Heroicons.Solid.plusSm []

        Plus ->
            Heroicons.Solid.plus []

        PresentationChartBar ->
            Heroicons.Solid.presentationChartBar []

        PresentationChartLine ->
            Heroicons.Solid.presentationChartLine []

        Printer ->
            Heroicons.Solid.printer []

        Puzzle ->
            Heroicons.Solid.puzzle []

        Qrcode ->
            Heroicons.Solid.qrcode []

        QuestionMarkCircle ->
            Heroicons.Solid.questionMarkCircle []

        ReceiptRefund ->
            Heroicons.Solid.receiptRefund []

        ReceiptTax ->
            Heroicons.Solid.receiptTax []

        Refresh ->
            Heroicons.Solid.refresh []

        Reply ->
            Heroicons.Solid.reply []

        Rewind ->
            Heroicons.Solid.rewind []

        Rss ->
            Heroicons.Solid.rss []

        SaveAs ->
            Heroicons.Solid.saveAs []

        Save ->
            Heroicons.Solid.save []

        Scale ->
            Heroicons.Solid.scale []

        Scissors ->
            Heroicons.Solid.scissors []

        SearchCircle ->
            Heroicons.Solid.searchCircle []

        Search ->
            Heroicons.Solid.search []

        Selector ->
            Heroicons.Solid.selector []

        Server ->
            Heroicons.Solid.server []

        Share ->
            Heroicons.Solid.share []

        ShieldCheck ->
            Heroicons.Solid.shieldCheck []

        ShieldExclamation ->
            Heroicons.Solid.shieldExclamation []

        ShoppingBag ->
            Heroicons.Solid.shoppingBag []

        ShoppingCart ->
            Heroicons.Solid.shoppingCart []

        SortAscending ->
            Heroicons.Solid.sortAscending []

        SortDescending ->
            Heroicons.Solid.sortDescending []

        Sparkles ->
            Heroicons.Solid.sparkles []

        Speakerphone ->
            Heroicons.Solid.speakerphone []

        Star ->
            Heroicons.Solid.star []

        StatusOffline ->
            Heroicons.Solid.statusOffline []

        StatusOnline ->
            Heroicons.Solid.statusOnline []

        Stop ->
            Heroicons.Solid.stop []

        Sun ->
            Heroicons.Solid.sun []

        Support ->
            Heroicons.Solid.support []

        SwitchHorizontal ->
            Heroicons.Solid.switchHorizontal []

        SwitchVertical ->
            Heroicons.Solid.switchVertical []

        Table ->
            Heroicons.Solid.table []

        Tag ->
            Heroicons.Solid.tag []

        Template ->
            Heroicons.Solid.template []

        Terminal ->
            Heroicons.Solid.terminal []

        ThumbDown ->
            Heroicons.Solid.thumbDown []

        ThumbUp ->
            Heroicons.Solid.thumbUp []

        Ticket ->
            Heroicons.Solid.ticket []

        Translate ->
            Heroicons.Solid.translate []

        Trash ->
            Heroicons.Solid.trash []

        TrendingDown ->
            Heroicons.Solid.trendingDown []

        TrendingUp ->
            Heroicons.Solid.trendingUp []

        Truck ->
            Heroicons.Solid.truck []

        Upload ->
            Heroicons.Solid.upload []

        UserAdd ->
            Heroicons.Solid.userAdd []

        UserCircle ->
            Heroicons.Solid.userCircle []

        UserGroup ->
            Heroicons.Solid.userGroup []

        UserRemove ->
            Heroicons.Solid.userRemove []

        User ->
            Heroicons.Solid.user []

        Users ->
            Heroicons.Solid.users []

        Variable ->
            Heroicons.Solid.variable []

        VideoCamera ->
            Heroicons.Solid.videoCamera []

        ViewBoards ->
            Heroicons.Solid.viewBoards []

        ViewGridAdd ->
            Heroicons.Solid.viewGridAdd []

        ViewGrid ->
            Heroicons.Solid.viewGrid []

        ViewList ->
            Heroicons.Solid.viewList []

        VolumeOff ->
            Heroicons.Solid.volumeOff []

        VolumeUp ->
            Heroicons.Solid.volumeUp []

        Wifi ->
            Heroicons.Solid.wifi []

        XCircle ->
            Heroicons.Solid.xCircle []

        X ->
            Heroicons.Solid.x []

        ZoomIn ->
            Heroicons.Solid.zoomIn []

        ZoomOut ->
            Heroicons.Solid.zoomOut []
