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
