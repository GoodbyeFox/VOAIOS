// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// 提示
  internal static let alert = L10n.tr("Localizable", "Alert")
  /// 全部文件
  internal static let allFile = L10n.tr("Localizable", "All File")
  /// 
  internal static let alt = L10n.tr("Localizable", "Alt")
  /// 
  internal static let bgColor = L10n.tr("Localizable", "BG Color")
  /// 取消
  internal static let cancel = L10n.tr("Localizable", "Cancel")
  /// 选择
  internal static let choose = L10n.tr("Localizable", "Choose")
  /// 选择移动位置
  internal static let chooseMovePosition = L10n.tr("Localizable", "Choose Move Position")
  /// 清除照片
  internal static let clearPhoto = L10n.tr("Localizable", "Clear Photo")
  /// 我分享的文件
  internal static let cloudFileMyShareFiles = L10n.tr("Localizable", "Cloud File My Share Files")
  /// 分享给我的
  internal static let cloudFileShareToMe = L10n.tr("Localizable", "Cloud File Share To Me")
  /// 文档
  internal static let cloudFileTypeDocument = L10n.tr("Localizable", "Cloud File Type Document")
  /// 图片
  internal static let cloudFileTypeImage = L10n.tr("Localizable", "Cloud File Type Image")
  /// 音乐
  internal static let cloudFileTypeMusic = L10n.tr("Localizable", "Cloud File Type Music")
  /// 其它
  internal static let cloudFileTypeOther = L10n.tr("Localizable", "Cloud File Type Other")
  /// 视频
  internal static let cloudFileTypeVideo = L10n.tr("Localizable", "Cloud File Type Video")
  /// 云盘
  internal static let cloudFiles = L10n.tr("Localizable", "Cloud Files")
  /// 创建文件夹失败！
  internal static let createFolderErrorMessage = L10n.tr("Localizable", "Create Folder Error Message")
  /// 删除
  internal static let delete = L10n.tr("Localizable", "Delete")
  /// 确定要删除这些数据吗？
  internal static let deleteItemsConfirmMessage = L10n.tr("Localizable", "Delete Items Confirm Message")
  /// 确定要取消这些分享的数据吗？
  internal static let deleteMyShareFileConfirmMessage = L10n.tr("Localizable", "Delete My Share File Confirm Message")
    /// 企业共享区
    internal static let cloudFileZoneName = L10n.tr("Localizable", "Cloud File V3 Zone Name")
    internal static let cloudFileMyFavorite = L10n.tr("Localizable", "Cloud File V3 My Favorite")
    internal static let cloudFileMyZone = L10n.tr("Localizable", "Cloud File V3 Zone Name")
    // 菜单
    internal static let cloudFileV3MenuAddFav = L10n.tr("Localizable", "Cloud File V3 Menu Add Favorite")
    internal static let cloudFileV3MenuCancelFav = L10n.tr("Localizable", "Cloud File V3 Menu Cancel Favorite")
    internal static let cloudFileV3MenuRenameFav = L10n.tr("Localizable", "Cloud File V3 Menu Rename")
    internal static let cloudFileV3MenuEditZone = L10n.tr("Localizable", "Cloud File V3 Menu Edit Zone")
    internal static let cloudFileV3MenuDeleteZone = L10n.tr("Localizable", "Cloud File V3 Menu Delete Zone")
    
    internal static func cloudFileV3ConfirmDeleteZone(_ message: String) -> String {
      return L10n.tr("Localizable", "Cloud File V3 Confirm Delete Zone", message)
    }
    internal static let cloudFileV3MessageAlertRenameFavorite = L10n.tr("Localizable", "Cloud File V3 Rename Alert Message")
    internal static let cloudFileV3MessageNameNotEmpty = L10n.tr("Localizable", "Cloud File V3 Name Not Empty Message")
    internal static let cloudFileV3ZoneFormCreateTitle = L10n.tr("Localizable", "Cloud File V3 Zone Form Create Title")
    internal static let cloudFileV3ZoneFormUpdateTitle = L10n.tr("Localizable", "Cloud File V3 Zone Form Update Title")
    internal static let cloudFileV3ZoneFileSaveToPan = L10n.tr("Localizable", "Cloud File V3 Zone File Save To My Pan")
    internal static let cloudFileV3ZoneFileNoPermissionUpdate = L10n.tr("Localizable", "Cloud File V3 Zone File No Permission Update")
    internal static let cloudFileV3ZoneFileNoPermissionDelete = L10n.tr("Localizable", "Cloud File V3 Zone File No Permission Delete")
    
  /// 完成
  internal static let done = L10n.tr("Localizable", "Done")
    /// 编辑
    internal static let edit = L10n.tr("Localizable", "Edit")
    /// App
    internal static let app = L10n.tr("Localizable", "App")
    
  /// 名称不能为空！
  internal static let emptyNameErrorMessage = L10n.tr("Localizable", "Empty name Error Message")
  /// 
  internal static let failedToConvertValueFromDataAtPath = L10n.tr("Localizable", "Failed to convert value from data at path %@")
  /// 
  internal static let failedToConvertValueFromDataAtURL = L10n.tr("Localizable", "Failed to convert value from data at URL %@")
  /// 
  internal static let formatNotFound = L10n.tr("Localizable", "Format %@ not found")
  /// 
  internal static let identifyFailed = L10n.tr("Localizable", "Identify failed")
  /// 
  internal static let insert = L10n.tr("Localizable", "Insert")
  /// 
  internal static let insertImage = L10n.tr("Localizable", "Insert Image")
  /// 
  internal static let insertImageFromDevice = L10n.tr("Localizable", "Insert Image From Device")
  /// 
  internal static let insertLink = L10n.tr("Localizable", "Insert Link")
  /// 移动
  internal static let move = L10n.tr("Localizable", "Move")
  /// 新建
  internal static let new = L10n.tr("Localizable", "New")
  /// 新建文件夹
  internal static let newFolder = L10n.tr("Localizable", "New Folder")
  /// 
  internal static let objectNotFoundForKey = L10n.tr("Localizable", "Object not found for key %@")
  /// 確定
  internal static let ok = L10n.tr("Localizable", "OK")
  /// 
  internal static let pickImage = L10n.tr("Localizable", "Pick Image")
  /// 
  internal static let pickNewImage = L10n.tr("Localizable", "Pick New Image")
  /// 重命名
  internal static let rename = L10n.tr("Localizable", "Rename")
  /// 
  internal static let requestExpectedLdBytesAndReceivedLdBytes = L10n.tr("Localizable", "Request expected %ld bytes and received %ld bytes")
  /// 分享
  internal static let share = L10n.tr("Localizable", "Share")
  /// 取消分享
  internal static let shareDelete = L10n.tr("Localizable", "Share Delete")
  /// 屏蔽共享
  internal static let shieldShare = L10n.tr("Localizable", "Shield Share")
  /// 确定要屏蔽这些分享给你的数据吗？
  internal static let shieldShareFileConfirmMessage = L10n.tr("Localizable", "Shield Share File Confirm Message")
  /// 
  internal static let textColor = L10n.tr("Localizable", "Text Color")
  /// 标题
  internal static let title = L10n.tr("Localizable", "Title")
  /// 更新
  internal static let update = L10n.tr("Localizable", "Update")
  /// 上传文件
  internal static let uploadFile = L10n.tr("Localizable", "Upload File")
  /// 
  internal static let urlRequired = L10n.tr("Localizable", "URL (required)")
  /// 
  internal static let 取消 = L10n.tr("Localizable", "取消")
    /// 更新成功
    internal static let applicationsUpdateSuccess = L10n.tr("Localizable", "Applications update success")
    ///
    internal static let applicationsUrlRequestError = L10n.tr("Localizable", "Applications Url request error")
    ///
    internal static let applicationsUrlIsEmpty = L10n.tr("Localizable", "Applications Url is empty")
    
    internal static let applicationsMainApp = L10n.tr("Localizable", "Applications Main App")
    internal static let applicationsNativeApp = L10n.tr("Localizable", "Applications Native App")
    internal static let applicationsPortalApp = L10n.tr("Localizable", "Applications Portal App")
    
    internal static let mainBarIm = L10n.tr("Localizable", "Main Bar IM")
    internal static let mainBarContacts = L10n.tr("Localizable", "Main Bar Contacts")
    internal static let mainBarApps = L10n.tr("Localizable", "Main Bar App")
    internal static let mainBarSettings = L10n.tr("Localizable", "Main Bar Settings")
    
    
    internal static let copy = L10n.tr("Localizable", "Copy")
    internal static let copySuccess = L10n.tr("Localizable", "Copy succeeded")
    
    internal static let sms = L10n.tr("Localizable", "SMS")
    internal static let smsFail = L10n.tr("Localizable", "SMS Fail")
    internal static let call = L10n.tr("Localizable", "CALL")
    internal static let callFail = L10n.tr("Localizable", "CALL Fail")
    
    /// Login
    internal enum Login {
        internal static let jailbrokenAlertMessage = L10n.tr("Localizable", "Login Jailbroken alert message")
        internal static let serverConfigInfoError = L10n.tr("Localizable", "Login Server config info error")
        internal static let ServerConfigIsEmpty = L10n.tr("Localizable", "Login Server config info is empty")
        internal static let UnknownError = L10n.tr("Localizable", "Login Unknown error")
        internal static let rebind = L10n.tr("Localizable", "Login Rebind")
        internal static let canNotGetServerList = L10n.tr("Localizable", "Login Can not get server list")
        internal static let binding = L10n.tr("Localizable", "Login binding")
        internal static let pleaseEnterValidationCode = L10n.tr("Localizable", "Login Please enter validation code")
        internal static let pleaseEnterMobilePhone = L10n.tr("Localizable", "Login Please enter mobile phone")
        internal static let mobilePhoneValidate = L10n.tr("Localizable", "Login Mobile phone validate")
        internal static let guidePage = L10n.tr("Localizable", "Login Guide page")
        internal static let nextStep = L10n.tr("Localizable", "Login Next step")
        internal static let selectServiceNode = L10n.tr("Localizable", "Login Select service node")
        internal static let donotScreenshot = L10n.tr("Localizable", "Login Do not screenshot")
        internal static let faceRecognitionLogin = L10n.tr("Localizable", "Login Face recognition login")
        internal static let fingerprintIdentificationLogin = L10n.tr("Localizable", "Login Fingerprint identification login")
        internal static let rebindToNewServiceNode = L10n.tr("Localizable", "Login Rebind to the new service node")
        internal static let passwordLogin = L10n.tr("Localizable", "Login Password login")
        internal static let verificationCodeLogin = L10n.tr("Localizable", "Login Verification code login")
        internal static let selectFollowLoginMethod = L10n.tr("Localizable", "Login Select the following login method")
        internal static let mobilePhoneNumberPasswordIsEmptry = L10n.tr("Localizable", "Login Mobile phone number or password is empty")
        internal static let captchaCodeIsEmpty = L10n.tr("Localizable", "Login Captcha is empty")
        internal static let sendCodeFail = L10n.tr("Localizable", "Login Send code fail")
        
        internal static let verifyLoginNow = L10n.tr("Localizable", "Login Verify login now")
        internal static let login = L10n.tr("Localizable", "Login Login")
        internal static let loginWithUsername = L10n.tr("Localizable", "Login Login with user name")
        internal static let bioLocked = L10n.tr("Localizable", "Login Bio auth locked")
        internal static let verificationFailed = L10n.tr("Localizable", "Login Verification failed")
        internal static let donotSupportBio = L10n.tr("Localizable", "Login do not support bio")
        internal static let loginFailUseOtherMethod = L10n.tr("Localizable", "Login Login fail use other method")
        internal static let getVarificationCode = L10n.tr("Localizable", "Login Get verification code")
        internal static let recapture = L10n.tr("Localizable", "Login Recapture")

        internal static func loginErrorWith(_ info: String) ->  String {
            return L10n.tr("Localizable", "Login Login fail error", info)
        }

        internal static func errorWithInfo(_ info: String) ->  String {
            return L10n.tr("Localizable", "Login Error with info", info)
        }
        internal static func rebindConfirmMessage(_ message: String) -> String {
          return L10n.tr("Localizable", "Login Confirm rebind message", message)
        }
    }
    
    internal enum Contacts {
        internal static let searchPlaceholder = L10n.tr("Localizable", "Contacts Search placeholder")
        internal static let topContacts = L10n.tr("Localizable", "Contacts Top contacts")
        internal static let myDepartment = L10n.tr("Localizable", "Contacts My department")
        internal static let orgStructre = L10n.tr("Localizable", "Contacts Org structure")
        
        internal static let enterpriseInformation = L10n.tr("Localizable", "Contacts Enterprise information")
        internal static let personName = L10n.tr("Localizable", "Contacts Person name")
        internal static let employeeNumber = L10n.tr("Localizable", "Contacts Employee number")
        internal static let uniqueCode = L10n.tr("Localizable", "Contacts Unique code")
        internal static let contactNumber = L10n.tr("Localizable", "Contacts Contact number")
        internal static let email = L10n.tr("Localizable", "Contacts Email")
        internal static let dept = L10n.tr("Localizable", "Contacts Dept")
        
        internal static let officePhone = L10n.tr("Localizable", "Contacts officePhone")
        internal static let superior = L10n.tr("Localizable", "Contacts superior")
        internal static let boardDate = L10n.tr("Localizable", "Contacts board date")
        internal static let description = L10n.tr("Localizable", "Contacts desc")
        internal static let personAttributes = L10n.tr("Localizable", "Contacts Person Attributes")
        
        
        internal static let initiateChat = L10n.tr("Localizable", "Contacts Initiate chat")
        internal static let unableToCreatChat = L10n.tr("Localizable", "Contacts Unable to create chat")
        internal static let sendEmail = L10n.tr("Localizable", "Contacts Send emails")
        internal static let sendEmailError = L10n.tr("Localizable", "Contacts Send emails Error")
    }
    
    internal enum Search {
        internal static let search = L10n.tr("Localizable", "Search")
        internal static let searchNoResult = L10n.tr("Localizable", "Search No Result")
        internal static let deleteAllSearchHistory = L10n.tr("Localizable", "Search Delete all search history")
        internal static let placeholder = L10n.tr("Localizable", "Search Placeholder")
        internal static let cmsCategory = L10n.tr("Localizable", "Search Cms category")
        internal static let processName = L10n.tr("Localizable", "Search Process Name")
    }
    
    // 新增
    internal static let todo = L10n.tr("Localizable", "Todo")
    internal static let doned = L10n.tr("Localizable", "Done")
    internal static let needRead = L10n.tr("Localizable", "Need Read")
    internal static let readed = L10n.tr("Localizable", "Readed")
    internal static let meeting = L10n.tr("Localizable", "Meeting")
    internal static let attendance = L10n.tr("Localizable", "Attendance")
    internal static let cms = L10n.tr("Localizable", "Cms")
    internal static let voiceAss = L10n.tr("Localizable", "VoiceAss")
    internal static let calendar = L10n.tr("Localizable", "Calendar")
    internal static let information = L10n.tr("Localizable", "Information")
    internal static let officeCenter = L10n.tr("Localizable", "OfficeCenter")
    internal static let deleteMessage = L10n.tr("Localizable", "DeleteMessage")
    internal static let accountSecurity = L10n.tr("Localizable", "Account Security")
    internal static let personalInformation = L10n.tr("Localizable", "Personal Information")
    internal static let skin = L10n.tr("Localizable", "Skin")
    internal static let notification = L10n.tr("Localizable", "Notification")
    internal static let general = L10n.tr("Localizable", "General")
    internal static let about = L10n.tr("Localizable", "About")
    
    internal static let minuteAgo = L10n.tr("Localizable", "MinuteAgo")
    internal static let justNow = L10n.tr("Localizable", "JustNow")
    internal static let hoursAgo = L10n.tr("Localizable", "HoursAgo")
    internal static let yesterday = L10n.tr("Localizable", "Yesterday")
    internal static let twoDaysAgo = L10n.tr("Localizable", "TwoDaysAgo")
    internal static let daysAgo = L10n.tr("Localizable", "DaysAgo")
    internal static let monthAgo = L10n.tr("Localizable", "MonthAgo")
    internal static let twoMonthAgo = L10n.tr("Localizable", "2MonthAgo")
    internal static let threeMonthAgo = L10n.tr("Localizable", "3MonthAgo")
    
    internal static let startWork = L10n.tr("Localizable", "StartWork")
    internal static let createSingle = L10n.tr("Localizable", "CreateSingle")
    internal static let createGroup = L10n.tr("Localizable", "CreateGroup")
    internal static let createSingleError = L10n.tr("Localizable", "CreateSingleError")
    internal static let createGroupError = L10n.tr("Localizable", "CreateGroupError")
    internal static let noMessage = L10n.tr("Localizable", "noMessage")
    
    internal static let change = L10n.tr("Localizable", "change")
    internal static let avatar = L10n.tr("Localizable", "avatar")
    internal static let code = L10n.tr("Localizable", "code")
    internal static let name = L10n.tr("Localizable", "name")
    internal static let gender = L10n.tr("Localizable", "gender")
    internal static let male = L10n.tr("Localizable", "male")
    internal static let female = L10n.tr("Localizable", "female")
    internal static let mobile = L10n.tr("Localizable", "mobile")
    internal static let wechat = L10n.tr("Localizable", "wechat")
    internal static let qq = L10n.tr("Localizable", "qq")
    internal static let logout = L10n.tr("Localizable", "logout")
    internal static let loginAccount = L10n.tr("Localizable", "loginAccount")
    internal static let password = L10n.tr("Localizable", "password")
    internal static let changePasswod = L10n.tr("Localizable", "changePasswod")
    internal static let outAuthorization = L10n.tr("Localizable", "outAuthorization")
    internal static let fingerprint = L10n.tr("Localizable", "fingerprint")
    internal static let unOpened = L10n.tr("Localizable", "unOpened")
    internal static let loading = L10n.tr("Localizable", "loading")
    internal static let errorLoadProfile = L10n.tr("Localizable", "errorLoadProfile")
    internal static let selectGender = L10n.tr("Localizable", "selectGender")
    internal static let exitConfirmMessage = L10n.tr("Localizable", "exitConfirmMessage")
    internal static let exit = L10n.tr("Localizable", "exit")
    internal static let updateError = L10n.tr("Localizable", "updateError")
    internal static let cleanMessage = L10n.tr("Localizable", "cleanMessage")
    internal static let editGroup = L10n.tr("Localizable", "editGroup")
    internal static let editMember = L10n.tr("Localizable", "editMember")
    internal static let deleteGroup = L10n.tr("Localizable", "deleteGroup")
    internal static let editItemConfirm = L10n.tr("Localizable", "editItemConfirm")
    internal static let deleteGroupConfirm = L10n.tr("Localizable", "deleteGroupConfirm")
    internal static let deleteChatConfirm = L10n.tr("Localizable", "deleteChatConfirm")
    internal static let cleanMessageConfirm = L10n.tr("Localizable", "cleanMessageConfirm")
    internal static let deleteFailed = L10n.tr("Localizable", "deleteFailed")
    internal static let cleanSuccess = L10n.tr("Localizable", "cleanSuccess")
    internal static let cleanFailed = L10n.tr("Localizable", "cleanFailed")
    internal static let groupNameComfirm = L10n.tr("Localizable", "groupNameComfirm")
    internal static let editSuccess = L10n.tr("Localizable", "editSuccess")
    internal static let editFailed = L10n.tr("Localizable", "editFailed")
    internal static let memberNotEnough = L10n.tr("Localizable", "memberNotEnough")
    internal static let selectMemberTip = L10n.tr("Localizable", "selectMemberTip")
    internal static let selectMemberError = L10n.tr("Localizable", "selectMemberError")
    internal static let sendMessageFailed = L10n.tr("Localizable", "sendMessageFailed")
    internal static let uploadError = L10n.tr("Localizable", "uploadError")
    internal static let withdraw = L10n.tr("Localizable", "withdraw")
    internal static let withdrawMemberMessage = L10n.tr("Localizable", "withdrawMemberMessage")
    internal static let withdrawalSuccessful = L10n.tr("Localizable", "withdrawalSuccessful")
    internal static let withdrawalFailed = L10n.tr("Localizable", "withdrawalFailed")
    internal static let loadFileFailed = L10n.tr("Localizable", "loadFileFailed")
    internal static let noPermissionLoadFile = L10n.tr("Localizable", "noPermissionLoadFile")
    internal static let releaseToSendSwipeToCancel = L10n.tr("Localizable", "releaseToSendSwipeToCancel")
    internal static let releaseFToSendSwipeToCancel = L10n.tr("Localizable", "releaseFToSendSwipeToCancel")
    internal static let playStart = L10n.tr("Localizable", "playStart")
    internal static let playStop = L10n.tr("Localizable", "playStop")
    internal static let playPause = L10n.tr("Localizable", "playPause")
    internal static let cannotReview = L10n.tr("Localizable", "cannotReview")
    internal static let getFileError = L10n.tr("Localizable", "getFileError")
    internal static let imgNull = L10n.tr("Localizable", "imgNull")

    internal static let createSubNode = L10n.tr("Localizable", "createSubNode")
    internal static let createSameLevelNode = L10n.tr("Localizable", "createSameLevelNode")
    internal static let editNode = L10n.tr("Localizable", "editNode")
    internal static let deleteNode = L10n.tr("Localizable", "deleteNode")
    internal static let addIcon = L10n.tr("Localizable", "addIcon")
    internal static let addImg = L10n.tr("Localizable", "addImg")
    internal static let addLink = L10n.tr("Localizable", "addLink")
    internal static let nullLink = L10n.tr("Localizable", "nullLink")
    internal static let errorLink = L10n.tr("Localizable", "errorLink")
    internal static let close = L10n.tr("Localizable", "close")
    internal static let onDutyCheckIn = L10n.tr("Localizable", "onDutyCheckIn")
    internal static let outDutyCheckIn = L10n.tr("Localizable", "outDutyCheckIn")    
    internal static let outCheckIn = L10n.tr("Localizable", "outCheckIn")
    internal static let process = L10n.tr("Localizable", "process")
    internal static let showrPocess = L10n.tr("Localizable", "showrPocess")
    internal static let hasCheckIn = L10n.tr("Localizable", "hasCheckIn")
    internal static let updateCheckIn = L10n.tr("Localizable", "updateCheckIn")
    internal static let needCheckIn = L10n.tr("Localizable", "needCheckIn")
    internal static let locationError = L10n.tr("Localizable", "locationError")
    internal static let updateProt = L10n.tr("Localizable", "updateProt")
    internal static let outCheckTips = L10n.tr("Localizable", "outCheckTips")
    internal static let outCheckProt = L10n.tr("Localizable", "outCheckProt")
    internal static let checkInTimeError = L10n.tr("Localizable", "checkInTimeError")
    internal static let submitCheckError = L10n.tr("Localizable", "submitCheckError")
    internal static let checkIn = L10n.tr("Localizable", "checkIn")
    internal static let statics = L10n.tr("Localizable", "statics")
//    internal static let XXXXXXXXX = L10n.tr("Localizable", "XXXXXXXXXX")

    
    internal static func errorWithMsg(_ message: String) -> String {
      return L10n.tr("Localizable", "Error with info", message)
    }

    internal enum ImageScale0 {
    /// 
    internal static let _5ByDefault = L10n.tr("Localizable", "Image scale, 0.5 by default")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
