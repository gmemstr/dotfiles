(defun me/org-mode ()
  "My custom configuration for 'org-mode'."
  (olivetti-mode)
  (olivetti-set-width 80)
  )
(add-hook 'org-mode-hook 'me/org-mode)

(defun me/write ()
  (get-buffer-create "*Writing Mode*")
  (switch-to-buffer "*Writing Mode*") 
  (org-mode))
