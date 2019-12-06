
import strutils
import sequtils
import tables

const gcMapOrbits = "input".readFile.split('\n').mapIt(it.split(')'))

type
    Planet = object
        parent: string
        child: seq[string]
        parentCount: int

func getParentCount(aPlanet: var Planet, aPlanets: Table[string, Planet]): int =
    result = aPlanet.parentCount
    if (0 == result) and ("" != aPlanet.parent):
        result = 1 + getParentCount(aPlanets[aPlanet.parent], aPlanets)
        aPlanet.parentCount = result

proc planets(aRelations: seq[seq[string]]): Table[string, Planet] =
    for relation in aRelations:
        var (lCenterID, lPlanetID) = (relation[0], relation[1])
        var lCenter = result.getOrDefault(lCenterID)
        lCenter.child.add(lPlanetID)
        result[lCenterId] = lCenter
        var lPlanet = result.getOrDefault(lPlanetID)
        lPlanet.parent = lCenterID
        result[lPlanetID] = lPlanet



proc partOne =
    echo $gcMapOrbits
    var lCount = 0
    var lPlanets = planets(gcMapOrbits)
    echo $lPlanets
    for lPlanet in lPlanets.values:
        lCount += getParentCount(lPlanet, lPlanets)
    echo $lPlanets
    echo $lCount

    echo "partOne $1"%[$1]

proc partTwo =
    echo "partTwo $1"%[$2]

# echo $loadWires()
partOne() # ???
partTwo() # ???
