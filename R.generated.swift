//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap { Locale(identifier: $0) } ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)

  /// Find first language and bundle for which the table exists
  fileprivate static func localeBundle(tableName: String, preferredLanguages: [String]) -> (Foundation.Locale, Foundation.Bundle)? {
    // Filter preferredLanguages to localizations, use first locale
    var languages = preferredLanguages
      .map { Locale(identifier: $0) }
      .prefix(1)
      .flatMap { locale -> [String] in
        if hostingBundle.localizations.contains(locale.identifier) {
          if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
            return [locale.identifier, language]
          } else {
            return [locale.identifier]
          }
        } else if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
          return [language]
        } else {
          return []
        }
      }

    // If there's no languages, use development language as backstop
    if languages.isEmpty {
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages = [developmentLocalization]
      }
    } else {
      // Insert Base as second item (between locale identifier and languageCode)
      languages.insert("Base", at: 1)

      // Add development language as backstop
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages.append(developmentLocalization)
      }
    }

    // Find first language for which table exists
    // Note: key might not exist in chosen language (in that case, key will be shown)
    for language in languages {
      if let lproj = hostingBundle.url(forResource: language, withExtension: "lproj"),
         let lbundle = Bundle(url: lproj)
      {
        let strings = lbundle.url(forResource: tableName, withExtension: "strings")
        let stringsdict = lbundle.url(forResource: tableName, withExtension: "stringsdict")

        if strings != nil || stringsdict != nil {
          return (Locale(identifier: language), lbundle)
        }
      }
    }

    // If table is available in main bundle, don't look for localized resources
    let strings = hostingBundle.url(forResource: tableName, withExtension: "strings", subdirectory: nil, localization: nil)
    let stringsdict = hostingBundle.url(forResource: tableName, withExtension: "stringsdict", subdirectory: nil, localization: nil)

    if strings != nil || stringsdict != nil {
      return (applicationLocale, hostingBundle)
    }

    // If table is not found for requested languages, key will be shown
    return nil
  }

  /// Load string from Info.plist file
  fileprivate static func infoPlistString(path: [String], key: String) -> String? {
    var dict = hostingBundle.infoDictionary
    for step in path {
      guard let obj = dict?[step] as? [String: Any] else { return nil }
      dict = obj
    }
    return dict?[key] as? String
  }

  static func validate() throws {
    try font.validate()
    try intern.validate()
  }

  #if os(iOS) || os(tvOS)
  /// This `R.storyboard` struct is generated, and contains static references to 4 storyboards.
  struct storyboard {
    /// Storyboard `Checkout`.
    static let checkout = _R.storyboard.checkout()
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `Main`.
    static let main = _R.storyboard.main()
    /// Storyboard `Movies`.
    static let movies = _R.storyboard.movies()

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "Checkout", bundle: ...)`
    static func checkout(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.checkout)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "Main", bundle: ...)`
    static func main(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.main)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "Movies", bundle: ...)`
    static func movies(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.movies)
    }
    #endif

    fileprivate init() {}
  }
  #endif

  /// This `R.color` struct is generated, and contains static references to 1 colors.
  struct color {
    /// Color `DarkGreen`.
    static let darkGreen = Rswift.ColorResource(bundle: R.hostingBundle, name: "DarkGreen")

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "DarkGreen", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func darkGreen(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.darkGreen, compatibleWith: traitCollection)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.file` struct is generated, and contains static references to 2 files.
  struct file {
    /// Resource file `BillionDreams_PERSONAL.ttf`.
    static let billionDreams_PERSONALTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "BillionDreams_PERSONAL", pathExtension: "ttf")
    /// Resource file `GoogleService-Info.plist`.
    static let googleServiceInfoPlist = Rswift.FileResource(bundle: R.hostingBundle, name: "GoogleService-Info", pathExtension: "plist")

    /// `bundle.url(forResource: "BillionDreams_PERSONAL", withExtension: "ttf")`
    static func billionDreams_PERSONALTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.billionDreams_PERSONALTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "GoogleService-Info", withExtension: "plist")`
    static func googleServiceInfoPlist(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.googleServiceInfoPlist
      return fileResource.bundle.url(forResource: fileResource)
    }

    fileprivate init() {}
  }

  /// This `R.font` struct is generated, and contains static references to 1 fonts.
  struct font: Rswift.Validatable {
    /// Font `BillionDreams`.
    static let billionDreams = Rswift.FontResource(fontName: "BillionDreams")

    /// `UIFont(name: "BillionDreams", size: ...)`
    static func billionDreams(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: billionDreams, size: size)
    }

    static func validate() throws {
      if R.font.billionDreams(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'BillionDreams' could not be loaded, is 'BillionDreams_PERSONAL.ttf' added to the UIAppFonts array in this targets Info.plist?") }
    }

    fileprivate init() {}
  }

  /// This `R.image` struct is generated, and contains static references to 2 images.
  struct image {
    /// Image `cart`.
    static let cart = Rswift.ImageResource(bundle: R.hostingBundle, name: "cart")
    /// Image `movies`.
    static let movies = Rswift.ImageResource(bundle: R.hostingBundle, name: "movies")

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "cart", bundle: ..., traitCollection: ...)`
    static func cart(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.cart, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "movies", bundle: ..., traitCollection: ...)`
    static func movies(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.movies, compatibleWith: traitCollection)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.nib` struct is generated, and contains static references to 2 nibs.
  struct nib {
    /// Nib `MovieTableViewCell`.
    static let movieTableViewCell = _R.nib._MovieTableViewCell()
    /// Nib `TitleTableCell`.
    static let titleTableCell = _R.nib._TitleTableCell()

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "MovieTableViewCell", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.movieTableViewCell) instead")
    static func movieTableViewCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.movieTableViewCell)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "TitleTableCell", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.titleTableCell) instead")
    static func titleTableCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.titleTableCell)
    }
    #endif

    static func movieTableViewCell(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> MovieTableViewCell? {
      return R.nib.movieTableViewCell.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? MovieTableViewCell
    }

    static func titleTableCell(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> TitleTableCell? {
      return R.nib.titleTableCell.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? TitleTableCell
    }

    fileprivate init() {}
  }

  /// This `R.reuseIdentifier` struct is generated, and contains static references to 1 reuse identifiers.
  struct reuseIdentifier {
    /// Reuse identifier `TitleTableCell`.
    static let titleTableCell: Rswift.ReuseIdentifier<TitleTableCell> = Rswift.ReuseIdentifier(identifier: "TitleTableCell")

    fileprivate init() {}
  }

  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }

    fileprivate init() {}
  }

  fileprivate class Class {}

  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    #if os(iOS) || os(tvOS)
    try storyboard.validate()
    #endif
  }

  #if os(iOS) || os(tvOS)
  struct nib {
    struct _MovieTableViewCell: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "MovieTableViewCell"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> MovieTableViewCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? MovieTableViewCell
      }

      fileprivate init() {}
    }

    struct _TitleTableCell: Rswift.NibResourceType, Rswift.ReuseIdentifierType {
      typealias ReusableType = TitleTableCell

      let bundle = R.hostingBundle
      let identifier = "TitleTableCell"
      let name = "TitleTableCell"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> TitleTableCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? TitleTableCell
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }
  #endif

  #if os(iOS) || os(tvOS)
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      #if os(iOS) || os(tvOS)
      try checkout.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try launchScreen.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try main.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try movies.validate()
      #endif
    }

    #if os(iOS) || os(tvOS)
    struct checkout: Rswift.StoryboardResourceType, Rswift.Validatable {
      let addressViewController = StoryboardViewControllerResource<AddressViewController>(identifier: "AddressViewController")
      let bundle = R.hostingBundle
      let cartViewController = StoryboardViewControllerResource<CartViewController>(identifier: "CartViewController")
      let name = "Checkout"
      let paymentMethodViewController = StoryboardViewControllerResource<PaymentMethodViewController>(identifier: "PaymentMethodViewController")
      let reviewOrderViewController = StoryboardViewControllerResource<ReviewOrderViewController>(identifier: "ReviewOrderViewController")

      func addressViewController(_: Void = ()) -> AddressViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: addressViewController)
      }

      func cartViewController(_: Void = ()) -> CartViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: cartViewController)
      }

      func paymentMethodViewController(_: Void = ()) -> PaymentMethodViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: paymentMethodViewController)
      }

      func reviewOrderViewController(_: Void = ()) -> ReviewOrderViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: reviewOrderViewController)
      }

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
        if _R.storyboard.checkout().addressViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'addressViewController' could not be loaded from storyboard 'Checkout' as 'AddressViewController'.") }
        if _R.storyboard.checkout().cartViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'cartViewController' could not be loaded from storyboard 'Checkout' as 'CartViewController'.") }
        if _R.storyboard.checkout().paymentMethodViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'paymentMethodViewController' could not be loaded from storyboard 'Checkout' as 'PaymentMethodViewController'.") }
        if _R.storyboard.checkout().reviewOrderViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'reviewOrderViewController' could not be loaded from storyboard 'Checkout' as 'ReviewOrderViewController'.") }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController

      let bundle = R.hostingBundle
      let name = "LaunchScreen"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct main: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = WelcomeViewController

      let bundle = R.hostingBundle
      let name = "Main"
      let welcomeViewController = StoryboardViewControllerResource<WelcomeViewController>(identifier: "WelcomeViewController")

      func welcomeViewController(_: Void = ()) -> WelcomeViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: welcomeViewController)
      }

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
        if _R.storyboard.main().welcomeViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'welcomeViewController' could not be loaded from storyboard 'Main' as 'WelcomeViewController'.") }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct movies: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UINavigationController

      let bundle = R.hostingBundle
      let movieDetailsViewController = StoryboardViewControllerResource<MovieDetailsViewController>(identifier: "MovieDetailsViewController")
      let moviesListViewController = StoryboardViewControllerResource<MoviesListViewController>(identifier: "MoviesListViewController")
      let name = "Movies"

      func movieDetailsViewController(_: Void = ()) -> MovieDetailsViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: movieDetailsViewController)
      }

      func moviesListViewController(_: Void = ()) -> MoviesListViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: moviesListViewController)
      }

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
        if _R.storyboard.movies().movieDetailsViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'movieDetailsViewController' could not be loaded from storyboard 'Movies' as 'MovieDetailsViewController'.") }
        if _R.storyboard.movies().moviesListViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'moviesListViewController' could not be loaded from storyboard 'Movies' as 'MoviesListViewController'.") }
      }

      fileprivate init() {}
    }
    #endif

    fileprivate init() {}
  }
  #endif

  fileprivate init() {}
}
