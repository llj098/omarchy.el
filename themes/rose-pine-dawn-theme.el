;;; rose-pine-dawn-theme.el --- Rose Pine Dawn, derived from Modus -*- lexical-binding: t; -*-

;; URL: https://github.com/llj098/omarchy.el
;; Version: 0.1.0
;; Package-Requires: ((emacs "29.1") (modus-themes "5.2"))
;; Keywords: faces, theme

;;; Commentary:
;;
;; Rose Pine Dawn for Emacs, derived from Modus Operandi through
;; `modus-themes-theme'.  The palette comes from the Dawn variant in
;; rose-pine/neovim.  Syntax slots follow that plugin's highlight groups,
;; matching the implementation style used by the other bundled themes.

;;; Code:

(require 'omarchy-themes)

(defconst rose-pine-dawn-palette-partial
  '(;; Core surfaces
    (bg-main       "#faf4ed")  ; base
    (bg-dim        "#fffaf3")  ; surface
    (bg-alt        "#f2e9e1")  ; overlay
    (bg-active     "#dfdad9")  ; highlight_med / selection
    (bg-inactive   "#f4ede8")  ; highlight_low
    (border        "#cecacd")  ; highlight_high

    ;; Foregrounds
    (fg-main       "#464261")  ; text
    (fg-dim        "#9893a5")  ; muted
    (fg-alt        "#797593")  ; subtle
    (cursor        "#464261")  ; text

    ;; Rose Pine Dawn named slots
    (rp-love       "#b4637a")
    (rp-gold       "#ea9d34")
    (rp-rose       "#d7827e")
    (rp-pine       "#286983")
    (rp-foam       "#56949f")
    (rp-iris       "#907aa9")
    (rp-leaf       "#6d8f89")
    (rp-subtle     "#797593")
    (rp-muted      "#9893a5")

    ;; Modus primary color slots
    (red           "#b4637a")
    (red-warmer    "#d7827e")
    (red-cooler    "#b4637a")
    (red-faint     "#d7827e")
    (red-intense   "#b4637a")
    (green         "#286983")
    (green-warmer  "#6d8f89")
    (green-cooler  "#56949f")
    (green-faint   "#6d8f89")
    (green-intense "#286983")
    (yellow        "#ea9d34")
    (yellow-warmer "#d7827e")
    (yellow-cooler "#ea9d34")
    (yellow-faint  "#ea9d34")
    (yellow-intense "#ea9d34")
    (blue          "#56949f")
    (blue-warmer   "#907aa9")
    (blue-cooler   "#286983")
    (blue-faint    "#56949f")
    (blue-intense  "#286983")
    (magenta       "#907aa9")
    (magenta-warmer "#b4637a")
    (magenta-cooler "#907aa9")
    (magenta-faint "#907aa9")
    (magenta-intense "#b4637a")
    (cyan          "#56949f")
    (cyan-warmer   "#d7827e")
    (cyan-cooler   "#286983")
    (cyan-faint    "#56949f")
    (cyan-intense  "#56949f")

    ;; Diff backgrounds tuned for the Dawn paper background
    (bg-added            "#d6e6cf")
    (bg-added-faint      "#e3efdf")
    (bg-added-refine     "#c2d9b5")
    (bg-added-intense    "#a9c79a")
    (fg-added            "#3e5c2a")
    (fg-added-intense    "#2f4720")

    (bg-removed          "#f2d9d9")
    (bg-removed-faint    "#f7e6e6")
    (bg-removed-refine   "#e9c3c3")
    (bg-removed-intense  "#d89999")
    (fg-removed          "#8a1f3a")
    (fg-removed-intense  "#6b1228")

    (bg-changed          "#f3e3c2")
    (bg-changed-faint    "#f7edd5")
    (bg-changed-refine   "#ecd091")
    (bg-changed-intense  "#d9b760")
    (fg-changed          "#7a5a10")
    (fg-changed-intense  "#5c4000"))
  "Rose Pine Dawn base colors in Modus palette format.")

(defconst rose-pine-dawn-palette-mappings-partial
  '(;; Syntax, following rose-pine/neovim highlight groups
    (keyword         rp-pine)
    (builtin         rp-iris)
    (constant        rp-gold)
    (fnname          rp-rose)
    (fnname-call     rp-rose)
    (name            rp-rose)
    (type            rp-foam)
    (variable        fg-main)
    (variable-use    fg-main)
    (identifier      fg-main)
    (property        rp-foam)
    (property-use    rp-foam)
    (string          rp-gold)
    (docstring       rp-gold)
    (comment         rp-subtle)
    (preprocessor    rp-iris)
    (operator        rp-subtle)
    (punctuation     rp-subtle)
    (rx-construct    rp-iris)
    (rx-backslash    rp-pine)

    ;; Status and diagnostics
    (err             rp-love)
    (warning         rp-gold)
    (info            rp-foam)
    (note            rp-pine)
    (success         rp-leaf)

    ;; Mode line
    (bg-mode-line-active       bg-alt)
    (fg-mode-line-active       fg-main)
    (border-mode-line-active   border)
    (bg-mode-line-inactive     bg-main)
    (fg-mode-line-inactive     fg-dim)
    (border-mode-line-inactive bg-active)
    (modeline-err              rp-love)
    (modeline-warning          rp-gold)
    (modeline-info             rp-foam)

    ;; Line numbers
    (fg-line-number-inactive   rp-muted)
    (fg-line-number-active     rp-iris)
    (bg-line-number-inactive   bg-main)
    (bg-line-number-active     bg-alt)

    ;; Region, highlighting, and search
    (bg-region                 bg-active)
    (fg-region                 fg-main)
    (bg-hl-line                bg-inactive)
    (bg-paren-match            bg-active)
    (fg-paren-match            rp-pine)
    (bg-search-current         rp-gold)
    (bg-search-lazy            bg-active)

    ;; Completion and popups
    (bg-completion             bg-alt)
    (bg-hover                  bg-active)
    (bg-hover-secondary        bg-alt)

    ;; Links and prompts
    (link                      rp-iris)
    (link-symbolic             rp-foam)
    (cursor                    fg-main)
    (prompt                    rp-foam)

    ;; Headings, following Rose Pine h1..h6 groups
    (fg-heading-0              rp-iris)
    (fg-heading-1              rp-iris)
    (fg-heading-2              rp-foam)
    (fg-heading-3              rp-rose)
    (fg-heading-4              rp-gold)
    (fg-heading-5              rp-pine)
    (fg-heading-6              rp-leaf)
    (fg-heading-7              rp-foam)
    (fg-heading-8              rp-rose))
  "Semantic slot mappings for Rose Pine Dawn.")

(defconst rose-pine-dawn-palette
  (modus-themes-generate-palette
   rose-pine-dawn-palette-partial
   nil
   modus-themes-operandi-palette
   rose-pine-dawn-palette-mappings-partial)
  "Complete Rose Pine Dawn palette for `modus-themes-theme'.")

(defcustom rose-pine-dawn-palette-overrides nil
  "User-level palette overrides for Rose Pine Dawn."
  :type '(repeat (list symbol (choice symbol string)))
  :group 'omarchy-themes)

(defvar rose-pine-dawn-custom-faces
  '(`(font-lock-variable-name-face ((,c :foreground ,fg-main :slant normal)))
    `(font-lock-variable-use-face  ((,c :foreground ,fg-main :slant normal)))
    `(help-argument-name           ((,c :foreground ,fg-main :slant normal))))
  "Additional face specs layered on the Modus-generated faces.")

(defvar rose-pine-dawn-custom-variables nil
  "Custom-variable specs layered on Modus defaults.")

(modus-themes-theme
 'rose-pine-dawn
 'omarchy-themes
 "Rose Pine Dawn, derived from Modus Operandi."
 'light
 'modus-themes-operandi-palette
 'rose-pine-dawn-palette
 'rose-pine-dawn-palette-overrides
 'rose-pine-dawn-custom-faces
 'rose-pine-dawn-custom-variables)

(provide 'rose-pine-dawn-theme)
;;; rose-pine-dawn-theme.el ends here
