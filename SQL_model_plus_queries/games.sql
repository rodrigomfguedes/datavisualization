SELECT
	m.round, m.Date, m.matchID,
    ms.ballPosession, ms.corners, ms.freekicks, ms.offsides, ms.score, ms.shotsOnGoal,
    tm.Teams_teamID, tm.home,
    t.team_name,
    g.GroupName
    
FROM
    matches m
INNER JOIN matchstatistics ms ON ms.matches_matchID = m.matchID
INNER JOIN teammatches tm ON tm.matches_matchID = m.matchID
INNER JOIN teams t ON t.teamID = tm.teams_teamID
INNER JOIN groups_c g ON g.GroupID = t.Groups_GroupID