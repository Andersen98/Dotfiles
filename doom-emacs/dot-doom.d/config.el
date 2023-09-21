(setq theme-favorites
    (list

        'doom-snazzy
        'doom-outrun-electric
        'doom-shades-of-purple))
;; which one i want
(setq doom-theme (nth 2 theme-favorites))

(setq doom-themes-treemacs-theme 'doom-colors)
(with-eval-after-load 'doom-themes
  (doom-themes-treemacs-config))

(setq org-directory "~/org")
