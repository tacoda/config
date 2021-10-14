(defun reload-config ()
	"Reloads my literate config file."
	(org-babel-load-file "~/.emacs.d/config.org"))

(setq vc-follow-symlinks nil)
(reload-config)
(put 'set-goal-column 'disabled nil)
