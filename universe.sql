CREATE DATABASE universe;
\c universe;

CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    age NUMERIC(10, 2), -- In billions of years
    is_spiral BOOLEAN DEFAULT TRUE,
    has_black_hole BOOLEAN DEFAULT FALSE,
    description TEXT
);

CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    galaxy_id INT REFERENCES galaxy(galaxy_id),
    distance_from_center NUMERIC(10, 2), -- In light-years
    temperature INT,
    luminosity INT,
    spectral_type VARCHAR(10)
);

CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    star_id INT REFERENCES star(star_id),
    orbit_period NUMERIC(10, 2), -- In Earth years
    mass INT, -- In Earth masses
    radius INT, -- In Earth radii
    has_atmosphere BOOLEAN DEFAULT TRUE
);

CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    planet_id INT REFERENCES planet(planet_id),
    distance_from_planet NUMERIC(10, 2), -- In km
    diameter INT, -- In km
    has_water_ice BOOLEAN DEFAULT FALSE,
    discovery_year INT
);

CREATE TABLE constellation (
    constellation_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
    visible_in_hemisphere VARCHAR(10)
);


INSERT INTO galaxy (name, age, is_spiral, has_black_hole, description)
VALUES
  ('Milky Way', 13.6, TRUE, TRUE, 'Our home galaxy'),
  ('Andromeda', 10, TRUE, TRUE, 'Nearest large galaxy to the Milky Way'),
  ('Triangulum', 14, TRUE, FALSE, 'Third-largest galaxy in the Local Group'),
  ('Sombrero Galaxy', 50, FALSE, TRUE, 'Pronounced bulge and dusty disk'),
  ('Whirlpool Galaxy', 30, TRUE, FALSE, 'Grand design spiral galaxy'),
  ('Centaurus A', 13, FALSE, TRUE, 'Active galactic nucleus');

INSERT INTO star (name, galaxy_id, distance_from_center, temperature, luminosity, spectral_type)
VALUES
  ('Sun', 1, 0, 5800, 1, 'G2V'),
  ('Sirius', 1, 8.6, 9940, 25, 'A1Vm'),
  ('Proxima Centauri', 1, 4.24, 3042, 0.0016, 'M5.5Ve'),
  ('Betelgeuse', 1, 640, 3500, 120000, 'M1-2Ia-ab'),
  ('Rigel', 1, 860, 11000, 85000, 'B8Ia'),
  ('Vega', 1, 25, 9602, 40, 'A0Va'),
  ('Andromeda I', 2, 250000, 5500, 1, 'G5V'),
  ('Andromeda II', 2, 210000, 4800, 0.5, 'K0V'),
  ('M31-V1', 2, 150000, 6000, 1.2, 'F2V'),
  ('M31-V2', 2, 180000, 5200, 0.8, 'G0V'),
  ('M31-V3', 2, 200000, 4500, 0.6, 'K5V'),
  ('M31-V4', 2, 230000, 6500, 1.5, 'F5V');

INSERT INTO planet (name, star_id, orbit_period, mass, radius, has_atmosphere)
VALUES
  ('Mercury', 1, 0.24, 0.055, 0.38, FALSE),
  ('Venus', 1, 0.62, 0.82, 0.95, TRUE),
  ('Earth', 1, 1, 1, 1, TRUE),
  ('Mars', 1, 1.88, 0.11, 0.53, TRUE),
  ('Jupiter', 1, 11.86, 317.8, 11.2, TRUE),
  ('Saturn', 1, 29.46, 95.16, 9.45, TRUE),
  ('Uranus', 1, 84.01, 14.54, 4.01, TRUE),
  ('Neptune', 1, 164.8, 17.15, 3.88, TRUE),
  ('Kepler-452b', 2, 384.8, 1.6, 1.1, TRUE),
  ('Proxima Centauri b', 3, 11.2, 1.3, 1.1, TRUE),
  ('Gliese 581 c', 4, 12.9, 5.3, 1.5, TRUE),
  ('HD 189733 b', 5, 2.2, 1.14, 1.14, TRUE);


INSERT INTO moon (name, planet_id, distance_from_planet, diameter, has_water_ice, discovery_year)
VALUES
  ('Moon', 3, 384400, 3474, FALSE, -1800),
  ('Phobos', 4, 9377, 22, FALSE, 1877),
  ('Deimos', 4, 23460, 12, FALSE, 1877),
  ('Io', 5, 421700, 3643, FALSE, 1610),
  ('Europa', 5, 671100, 3138, TRUE, 1610),
  ('Ganymede', 5, 1070400, 5262, TRUE, 1610),
  ('Callisto', 5, 1882700, 4820, TRUE, 1610),
  ('Titan', 6, 1221870, 5150, TRUE, 1655),
  ('Rhea', 6, 527040, 1528, TRUE, 1672),
  ('Iapetus', 6, 3561300, 1470, TRUE, 1671),
  ('Dione', 6, 377400, 1123, TRUE, 1684),
  ('Tethys', 6, 294670, 1060, TRUE, 1684),
  ('Enceladus', 6, 238020, 504, TRUE, 1789),
  ('Mimas', 6, 185520, 396, FALSE, 1789),
  ('Ariel', 7, 190900, 1160, TRUE, 1851),
  ('Umbriel', 7, 266000, 1170, FALSE, 1851),
  ('Titania', 7, 435800, 1578, TRUE, 1787),
  ('Oberon', 7, 793700, 1523, TRUE, 1787),
  ('Triton', 8, 354759, 2707, TRUE, 1846),
  ('Proteus', 8, 117647, 416, FALSE, 1989);
	
	
	INSERT INTO constellation (name, description, visible_in_hemisphere)
VALUES
  ('Orion', 'Prominent constellation with bright stars', 'Both'),
  ('Ursa Major', 'Contains the Big Dipper asterism', 'Northern'),
  ('Taurus', 'Bull constellation, includes the Pleiades', 'Northern'),
  ('Scorpius', 'Scorpion constellation', 'Southern'),
  ('Sagittarius', 'Archer constellation', 'Southern'),
  ('Cassiopeia', 'W-shaped constellation', 'Northern'),
  ('Andromeda', 'Princess chained to a rock', 'Northern'),
  ('Pegasus', 'Winged horse', 'Northern'),
  ('Draco', 'Dragon constellation', 'Northern'),
  ('Leo', 'Lion constellation', 'Northern'),
  ('Gemini', 'Twins constellation', 'Northern'),
  ('Canis Major', 'Larger of the two Dogs', 'Southern');