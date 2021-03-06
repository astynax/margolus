module Margolus.Rules.Water where

import Margolus.Types

rules :: RuleTable
rules = [ ".. ..|.. ..|.. ..|.. ..|.. ..|.. ..|.. ..|.. ..|.. ..|.. ..|.. ..|.. ..|.. ..|.. ..|.. ..|.. ..|"
        , ".. ..|.* .*|.# .#|.$ .$|*. *.|** **|*# *#|*$ *$|#. #.|#* #*|## ##|#$ #$|$. $.|$* $*|$# $#|$$ $$|"

        , ".* ..|.* ..|.* ..|.* ..|.* ..|.* .*|.* .#|.* .*|.* ..|.* .*|.* .#|.* .*|.* ..|.* .*|.* .#|.* .*|"
        , ".. .*|.* **|.# ##|.$ *$|*. **|** **|*# ##|*$ *$|#. ##|#* ##|## ##|#$ #$|$. $*|$* $*|$# $#|$$ $$|"

        , ".# .#|.# .#|.# .#|.# .#|.# .#|.# .#|.# .#|.# .#|.# .#|.# .#|.# .#|.# .#|.# .#|.# .#|.# .#|.# .#|"
        , ".. ..|.* .#|.# .#|.$ .$|*. *.|** *#|*# ##|*$ *#|#. #.|#* ##|## ##|#$ #$|$. $.|$* $#|$# ##|$$ $#|"

        , ".$ .$|.$ .$|.$ .#|.$ .$|.$ .$|.$ .$|.$ .#|.$ .$|.$ .$|.$ .$|.$ .#|.$ .$|.$ .$|.$ .$|.$ .#|.$ .$|"
        , ".. .*|.* .*|.# .#|.$ .$|*. **|** **|*# ##|*$ *$|#. ##|#* ##|## ##|#$ ##|$. $.|$* $*|$# ##|$$ $$|"

        , "*. ..|*. ..|*. ..|*. ..|*. ..|*. *.|*. *.|*. *.|*. ..|*. #.|*. #.|*. #.|*. ..|*. *.|*. *.|*. *.|"
        , ".. *.|.* **|.# *#|.$ *$|*. **|** **|*# ##|*$ *$|#. #*|#* ##|## ##|#$ ##|$. $*|$* $*|$# ##|$$ $$|"

        , "** ..|** .*|** .#|** .*|** *.|** **|** *#|** **|** #.|** #*|** ##|** #*|** *.|** **|** *#|** **|"
        , ".. **|.* **|.# ##|.$ *$|*. **|** **|*# ##|*$ *$|#. ##|#* ##|## ##|#$ ##|$. $*|$* $*|$# ##|$$ $$|"

        , "*# ##|*# ##|*# ##|*# ##|*# ##|*# ##|*# ##|*# ##|*# ##|*# ##|*# ##|*# ##|*# ##|*# ##|*# ##|*# ##|"
        , ".. ..|.* .#|.# .#|.$ .#|*. *.|** *#|*# ##|*$ *#|#. #.|#* ##|## ##|#$ ##|$. $.|$* $#|$# ##|$$ $#|"

        , "*$ .$|*$ .$|*$ .#|*$ .$|*$ *$|*$ *$|*$ *#|*$ *$|*$ #$|*$ #$|*$ ##|*$ #$|*$ *$|*$ *$|*$ *#|*$ *$|"
        , ".. **|.* **|.# ##|.$ *$|*. **|** **|*# ##|*$ *$|#. #.|#* ##|## ##|#$ ##|$. $.|$* $*|$# ##|$$ $$|"

        , "#. #.|#. #.|#. #.|#. #.|#. #.|#. #.|#. #.|#. #.|#. #.|#. #.|#. #.|#. #.|#. #.|#. #.|#. #.|#. #.|"
        , ".. ..|.* .*|.# .#|.$ .$|*. #.|** #*|*# ##|*$ #$|#. #.|#* ##|## ##|#$ ##|$. #.|$* #*|$# ##|$$ #$|"

        , "#* #.|#* ##|#* ##|#* ##|#* #.|#* ##|#* ##|#* ##|#* ##|#* ##|#* ##|#* ##|#* ##|#* ##|#* ##|#* ##|"
        , ".. .*|.* .*|.# .#|.$ .$|*. #*|** #*|*# ##|*$ #$|#. #.|#* ##|## ##|#$ ##|$. #.|$* #*|$# ##|$$ #$|"

        , "## ##|## ##|## ##|## ##|## ##|## ##|## ##|## ##|## ##|## ##|## ##|## ##|## ##|## ##|## ##|## ##|"
        , ".. ..|.* .#|.# .#|.$ .#|*. #.|** ##|*# ##|*$ ##|#. #.|#* ##|## ##|#$ ##|$. #.|$* ##|$# ##|$$ ##|"

        , "#$ ##|#$ ##|#$ ##|#$ ##|#$ ##|#$ ##|#$ ##|#$ ##|#$ ##|#$ ##|#$ ##|#$ ##|#$ ##|#$ ##|#$ ##|#$ ##|"
        , ".. .*|.* .*|.# .#|.$ .$|*. #*|** #*|*# ##|*$ #$|#. #*|#* #*|## ##|#$ ##|$. #*|$* #*|$# ##|$$ #$|"

        , "$. $.|$. $.|$. $.|$. $.|$. $.|$. $.|$. $.|$. $.|$. #.|$. #.|$. #.|$. #.|$. $.|$. $.|$. $.|$. $.|"
        , ".. *.|.* **|.# ##|.$ *$|*. *.|** **|*# ##|*$ *$|#. #.|#* ##|## ##|#$ ##|$. $.|$* $*|$# ##|$$ $$|"

        , "$* $.|$* $*|$* $#|$* $*|$* $.|$* $*|$* $#|$* $*|$* #.|$* #*|$* ##|$* #*|$* $.|$* $*|$* $#|$* $*|"
        , ".. **|.* **|.# .#|.$ .$|*. **|** **|*# ##|*$ *$|#. ##|#* ##|## ##|#$ ##|$. $*|$* $*|$# ##|$$ $$|"

        , "$# ##|$# ##|$# ##|$# ##|$# ##|$# ##|$# ##|$# ##|$# ##|$# ##|$# ##|$# ##|$# ##|$# ##|$# ##|$# ##|"
        , ".. *.|.* *#|.# .#|.$ *#|*. *.|** *#|*# ##|*$ *#|#. #.|#* ##|## ##|#$ ##|$. $.|$* $#|$# ##|$$ $#|"

        , "$$ $$|$$ $$|$$ $#|$$ $$|$$ $$|$$ $$|$$ $#|$$ $$|$$ #$|$$ #$|$$ ##|$$ #$|$$ $$|$$ $$|$$ $#|$$ $$|"
        , ".. **|.* **|.# *#|.$ *$|*. **|** **|*# ##|*$ *$|#. #*|#* ##|## ##|#$ ##|$. $*|$* $*|$# ##|$$ $$|" ]
