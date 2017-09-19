(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.saves"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups

(require 'ess-site)
(add-hook 'ess-mode-hook
          (lambda ()
            (ess-toggle-underscore nil)))


;; LaTeX
(add-hook 'LaTeX-mode-hook 'turn-on-flyspell)
(add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)
(setq-default TeX-engine 'xetex)
(setq-default TeX-PDF-mode t)
(setq TeX-view-program-selection
      '((output-pdf "PDF Viewer")))
(setq TeX-view-program-list
      '(("PDF Viewer" "xdg-open %o")))
(setq TeX-engine-alist 
      '(
        (xetex "XeTeX" 
               "xetex --file-line-error" 
               "xelatex --file-line-error" 
               "xetex")
        (xetex_sh "XeTeX shell escape" 
                  "xetex --file-line-error --shell-escape" 
                  "xelatex --file-line-error --shell-escape" 
                  "xetex")))
;; Switch dict easily
(defun fd-switch-dictionary()
  (interactive)
  (let* ((dic ispell-current-dictionary)
    	 (change (if (string= dic "french") "english" "french")))
    (ispell-change-dictionary change)
    (message "Dictionary switched from %s to %s" dic change)
    ))
    
(global-set-key (kbd "<f8>")   'fd-switch-dictionary)
;; Get a decent latex template
(require 'ox-latex)
(add-to-list 'org-latex-classes
             '("bs-article"
               "\\documentclass[12pt,xelatex,a4paper]{article}
\\usepackage{fontspec}
\\setmainfont[Mapping=tex-text]{Minion Pro}
\\let\\sfdefault\\rmdefault
\\usepackage{xunicode}
\\usepackage{polyglossia}
\\usepackage[top=2.5cm,bottom=2.5cm,left=2.5cm,right=2.5cm]{geometry}
\\usepackage{graphicx} 
\\usepackage{amsmath}
\\usepackage{amssymb}
\\usepackage{float}
\\usepackage[colorlinks=true,urlcolor=blue]{hyperref}
\\hypersetup{pdfborderstyle={/S/U/W 1}}
\\title{}
[NO-DEFAULT-PACKAGES]
[NO-PACKAGES]"
("\\section{%s}" . "\\section*{%s}")
("\\subsection{%s}" . "\\subsection*{%s}")
("\\subsubsection{%s}" . "\\subsubsection*{%s}")
("\\paragraph{%s}" . "\\paragraph*{%s}")
("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
;; Allow multiline bold and emphasis in org mode
(setcar (nthcdr 4 org-emphasis-regexp-components) 1000)
(setcar (nthcdr 4 org-emphasis-regexp-components) 1000)

(setq org-reveal-root "/home/bservin/lib/js/reveal.js")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tango-dark)))
 '(inhibit-startup-screen t))
