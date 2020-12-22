import SwiftUI

extension View {
	public func previewEnvironment(_ previewEnvironment: PreviewEnvironment) -> some View {
		self
			.environment(\.sizeCategory, previewEnvironment.sizeCategory) //不同大小
			.environment(\.colorScheme, previewEnvironment.colorScheme) //暗黑系统
			.environment(\.locale, previewEnvironment.locale) //本地化
			.environment(\.layoutDirection, previewEnvironment.layoutDirection) //设备方向
			.environment(\.legibilityWeight, previewEnvironment.legibilityWeight) //辅助功能加粗
			.previewDevice(previewEnvironment.device) //不同设备
			.previewLayout(previewEnvironment.layout) //布局
			.previewDisplayName(previewEnvironment.description) //画布显示的名称
	}

	public func multiplePreviewEnvironments(
		previewEnvironments: [PreviewEnvironment] = .default
	) -> some View {
		ForEach(previewEnvironments, id: \.self) { previewEnvironment in
			self.previewEnvironment(previewEnvironment)
		}
	}
}

public struct PreviewEnvironment: Hashable {
	public var sizeCategory: ContentSizeCategory = defaultSizeCategory
	public var colorScheme: ColorScheme = defaultColorScheme
	public var locale: Locale = defaultLocale
	public var layoutDirection: LayoutDirection = defaultLayoutDirection
	public var legibilityWeight: LegibilityWeight = defaultLegibilityWeight
	public var device: PreviewDevice? = nil
	public var layout: PreviewLayout = .device

	// TODO: Add preview options once there is a way to edit the settings in a live preview
	// public var colorSchemeContrast: ColorSchemeContrast = defaultColorSchemeContrast
	// public var differentiateWithoutColor: Bool = defaultDifferentiateWithoutColor
	// public var reduceTransparency: Bool = defaultReduceTransparency
	// public var reduceMotion: Bool = defaultReduceMotion
	// public var invertColors: Bool = defaultInvertColors

	private static var defaultSizeCategory: ContentSizeCategory = .medium
	private static var defaultColorScheme: ColorScheme = .light
	private static var defaultLocale: Locale = .current
	private static var defaultLayoutDirection: LayoutDirection = .leftToRight
	private static var defaultLegibilityWeight: LegibilityWeight = .regular
}

extension PreviewEnvironment: CustomStringConvertible {
	public var description: String {
		let computedValue = [
			sizeCategory == Self.defaultSizeCategory ? nil : String(describing: sizeCategory),
			colorScheme == Self.defaultColorScheme ? nil : String(describing: colorScheme),
			locale == Self.defaultLocale ? nil : locale.identifier,
			layoutDirection == Self.defaultLayoutDirection ? nil : String(describing: layoutDirection),
			legibilityWeight == Self.defaultLegibilityWeight ? nil : String(describing: legibilityWeight),
			device?.rawValue,
		]
			.compactMap({ $0 })
			.joined(separator: " — ")
		return computedValue.isEmpty ? "default" : computedValue
	}
}

extension Array where Element == PreviewEnvironment {
	public static let `default`: Self = [
		.init(),
		.init(sizeCategory: .extraSmall),
		.init(colorScheme: .dark),
		.init(layoutDirection: .rightToLeft),
		.init(sizeCategory: .extraExtraLarge),
	]
}
