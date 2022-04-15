SELECT
	s.StadiumName, s.Capacity, s.Latitude, s.Longitude,
    c.CityName,
    ct.CoutryInitials,
    t.totaltrophies, t.team_name
FROM
    stadiums s
INNER JOIN cities c ON c.CityID = s.Cities_CityID
INNER JOIN countries ct ON ct.countryID = c.Countries_countryID
INNER JOIN teams t on t.Stadiums_stadiumID = s.stadiumID