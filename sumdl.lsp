(defun c:SUMDL (/ ss i obj total)
  (setq ss (ssget '((0 . "LINE,ARC,CIRCLE,LWPOLYLINE,POLYLINE"))))
  (setq total 0)
  (if ss
    (progn
      (setq i 0)
      (repeat (sslength ss)
        (setq obj (vlax-ename->vla-object (ssname ss i)))
        (if (vlax-property-available-p obj 'Length)
          (setq total (+ total (vla-get-length obj)))
        )
        (setq i (1+ i))
      )
      (prompt (strcat "\nTotal length: " (rtos total 2 3)))
    )
    (prompt "\nNo objects chosen.")
  )
  (princ)
)


