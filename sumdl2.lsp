(defun c:SUMDL (/ ss i ent total)
  (setq ss (ssget '((0 . "LINE,ARC,CIRCLE,LWPOLYLINE,POLYLINE"))))
  (setq total 0.0)

  (if ss
    (progn
      (setq i 0)
      (repeat (sslength ss)
        (setq ent (ssname ss i))
        (if (vlax-curve-isClosed ent)
          (setq total
                (+ total
                   (vlax-curve-getDistAtParam
                     ent
                     (vlax-curve-getEndParam ent))))
          (setq total
                (+ total
                   (vlax-curve-getDistAtParam
                     ent
                     (vlax-curve-getEndParam ent))))
        )
        (setq i (1+ i))
      )
      (prompt (strcat "\nTotal length: " (rtos total 2 3)))
    )
    (prompt "\nNo objects chosen.")
  )
  (princ)
)
