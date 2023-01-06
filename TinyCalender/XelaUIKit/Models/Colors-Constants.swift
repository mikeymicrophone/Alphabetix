// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS
)
    import AppKit
#elseif os(iOS)
    import UIKit
#elseif os(tvOS) || os(watchOS)
    import UIKit
#endif
#if canImport(SwiftUI)
    import SwiftUI
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetColorTypeAlias = ColorAsset.Color

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Colors {
    internal static let background = ColorAsset(name: "background")
    internal static let primaryButtonBlue = ColorAsset(name: "primary-button-blue")
    internal static let primaryButtonFocusedBorder = ColorAsset(name: "primary-button-focused-border")
    internal static let primaryButtonForeground = ColorAsset(name: "primary-button-foreground")
    internal static let primaryButtonHover = ColorAsset(name: "primary-button-hover")
    internal static let tfDefaultBorder = ColorAsset(name: "tf-default-border")
    internal static let tfDefaultFill = ColorAsset(name: "tf-default-fill")
    internal static let tfDefaultHelperText = ColorAsset(name: "tf-default-helperText")
    internal static let tfDefaultImages = ColorAsset(name: "tf-default-images")
    internal static let tfDefaultPlaceholder = ColorAsset(name: "tf-default-placeholder")
    internal static let tfDefaultValue = ColorAsset(name: "tf-default-value")
    internal static let tfDisabledBorder = ColorAsset(name: "tf-disabled-border")
    internal static let tfDisabledFill = ColorAsset(name: "tf-disabled-fill")
    internal static let tfDisabledHelperText = ColorAsset(name: "tf-disabled-helperText")
    internal static let tfDisabledImages = ColorAsset(name: "tf-disabled-images")
    internal static let tfDisabledPlaceholder = ColorAsset(name: "tf-disabled-placeholder")
    internal static let tfDisabledValue = ColorAsset(name: "tf-disabled-value")
    internal static let tfErrorBorder = ColorAsset(name: "tf-error-border")
    internal static let tfErrorFill = ColorAsset(name: "tf-error-fill")
    internal static let tfErrorHelperText = ColorAsset(name: "tf-error-helperText")
    internal static let tfErrorImages = ColorAsset(name: "tf-error-images")
    internal static let tfErrorPlaceholder = ColorAsset(name: "tf-error-placeholder")
    internal static let tfErrorValue = ColorAsset(name: "tf-error-value")
    internal static let tfFocusedBorder = ColorAsset(name: "tf-focused-border")
    internal static let tfFocusedFill = ColorAsset(name: "tf-focused-fill")
    internal static let tfFocusedHelperText = ColorAsset(name: "tf-focused-helperText")
    internal static let tfFocusedImages = ColorAsset(name: "tf-focused-images")
    internal static let tfFocusedPlaceholder = ColorAsset(name: "tf-focused-placeholder")
    internal static let tfFocusedValue = ColorAsset(name: "tf-focused-value")
    internal static let tfHoverBorder = ColorAsset(name: "tf-hover-border")
    internal static let tfHoverFill = ColorAsset(name: "tf-hover-fill")
    internal static let tfHoverHelperText = ColorAsset(name: "tf-hover-helperText")
    internal static let tfHoverImages = ColorAsset(name: "tf-hover-images")
    internal static let tfHoverPlaceholder = ColorAsset(name: "tf-hover-placeholder")
    internal static let tfHoverValue = ColorAsset(name: "tf-hover-value")
    internal static let tfSuccessBorder = ColorAsset(name: "tf-success-border")
    internal static let tfSuccessFill = ColorAsset(name: "tf-success-fill")
    internal static let tfSuccessHelperText = ColorAsset(name: "tf-success-helperText")
    internal static let tfSuccessImages = ColorAsset(name: "tf-success-images")
    internal static let tfSuccessPlaceholder = ColorAsset(name: "tf-success-placeholder")
    internal static let tfSuccessValue = ColorAsset(name: "tf-success-value")
}

// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal final class ColorAsset {
    internal fileprivate(set) var name: String

    #if os(macOS)
        internal typealias Color = NSColor
    #elseif os(iOS) || os(tvOS) || os(watchOS)
        internal typealias Color = UIColor
    #endif

    @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
    internal private(set) lazy var color: Color = {
        guard let color = Color(asset: self) else {
            fatalError("Unable to load color asset named \(name).")
        }
        return color
    }()

    #if os(iOS) || os(tvOS)
        @available(iOS 11.0, tvOS 11.0, *)
        internal func color(compatibleWith traitCollection: UITraitCollection) -> Color {
            let bundle = BundleToken.bundle
            guard let color = Color(named: name, in: bundle, compatibleWith: traitCollection) else {
                fatalError("Unable to load color asset named \(name).")
            }
            return color
        }
    #endif

    #if canImport(SwiftUI)
        @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
        internal private(set) lazy var swiftUIColor: SwiftUI.Color = .init(asset: self)
    #endif

    fileprivate init(name: String) {
        self.name = name
    }
}

internal extension ColorAsset.Color {
    @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
    convenience init?(asset: ColorAsset) {
        let bundle = BundleToken.bundle
        #if os(iOS) || os(tvOS)
            self.init(named: asset.name, in: bundle, compatibleWith: nil)
        #elseif os(macOS)
            self.init(named: NSColor.Name(asset.name), bundle: bundle)
        #elseif os(watchOS)
            self.init(named: asset.name)
        #endif
    }
}

#if canImport(SwiftUI)
    @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
    internal extension SwiftUI.Color {
        init(asset: ColorAsset) {
            let bundle = BundleToken.bundle
            self.init(asset.name, bundle: bundle)
        }
    }
#endif

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
