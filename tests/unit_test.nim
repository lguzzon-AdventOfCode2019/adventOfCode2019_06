
import unittest

import adventOfCode2019_06
import adventOfCode2019_06/consts


suite "unit-test suite":
    test "getMessage":
        assert(cHelloWorld == getMessage())
