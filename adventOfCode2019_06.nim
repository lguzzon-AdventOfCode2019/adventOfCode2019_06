
import strutils
import sequtils
import sets
import tables

const
  gcMapOrbits = "input".readFile.split('\n').filterIt("" != it).mapIt(it.split(')'))

type
  Planet = object
    parent: string
    child: seq[string]
    parentCount: int

func planets(aRelations: seq[seq[string]]): Table[string, Planet] =
  for relation in aRelations:
    var (lCenterID, lPlanetID) = (relation[0], relation[1])
    var lCenter = result.getOrDefault(lCenterID)
    lCenter.child.add(lPlanetID)
    result[lCenterId] = lCenter
    var lPlanet = result.getOrDefault(lPlanetID)
    lPlanet.parent = lCenterID
    result[lPlanetID] = lPlanet

func getParentCount(aPlanetId: string, aPlanets: var Table[string,
        Planet]): int =
  var lPlanet = aPlanets[aPlanetId]
  result = lPlanet.parentCount
  if (0 == result) and ("" != lPlanet.parent):
    result = 1 + getParentCount(lPlanet.parent, aPlanets)
    lPlanet.parentCount = result
    aPlanets[aPlanetId] = lPlanet


proc partOne =
  # echo $gcMapOrbits
  var lCount = 0
  var lPlanets = planets(gcMapOrbits)
  # echo $lPlanets
  for lPlanetId in lPlanets.keys:
    lCount += getParentCount(lPlanetId, lPlanets)
  # echo $lPlanets
  echo "partOne $1"%[$lCount]

func getParents(aPlanetId: string, aPlanets: Table[string, Planet]): HashSet[string] =
  var lParentId = aPlanets[aPlanetId].parent
  while "" != lParentId:
    result.incl(lParentId)
    lParentId = aPlanets[lParentId].parent

proc partTwo =
  const
    gcPlanets = planets(gcMapOrbits)
  let lMinimumOrbital = (getParents("YOU", gcPlanets) -+- getParents("SAN",
      gcPlanets)).len

  echo "partTwo $1"%[$lMinimumOrbital]

partOne() # 142915
partTwo() # 283
