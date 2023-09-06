;; added to $DOOMDIR/config.el
(setq doom-font 
    (font-spec 
        :family "OpenDyslexicM Nerd Font Mono"
        :size 24 
        :style "regular"))

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

(setq org-agenda-files '("~/gtd/inbox.org"
                         "~/gtd/gtd.org"
                         "~/gtd/tickler.org"))

(setq org-capture-templates '(("t" "Todo [inbox]" entry
                              (file+headline "~/gtd/inbox.org" "Tasks")
                              "* TODO %i%?")
                              ("T" "Tickler" entry
                               (file+headline "~/gtd/tickler.org" "Tickler")
                              "* %i%? \n %U")))

(setq org-refile-targets '(("~/gtd/gtd.org" :maxlevel . 3)
                           ("~/gtd/someday.org" :level . 1)
                           ("~/gtd/tickler.org" :maxlevel . 2)))
