CREATE TABLE parents AS
  SELECT "abraham" AS parent, "barack" AS child UNION
  SELECT "abraham"          , "clinton"         UNION
  SELECT "delano"           , "herbert"         UNION
  SELECT "fillmore"         , "abraham"         UNION
  SELECT "fillmore"         , "delano"          UNION
  SELECT "fillmore"         , "grover"          UNION
  SELECT "eisenhower"       , "fillmore";

CREATE TABLE dogs AS
  SELECT "abraham" AS name, "long" AS fur, 26 AS height UNION
  SELECT "barack"         , "short"      , 52           UNION
  SELECT "clinton"        , "long"       , 47           UNION
  SELECT "delano"         , "long"       , 46           UNION
  SELECT "eisenhower"     , "short"      , 35           UNION
  SELECT "fillmore"       , "curly"      , 32           UNION
  SELECT "grover"         , "short"      , 28           UNION
  SELECT "herbert"        , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;


-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_parent_height AS
  SELECT p.child
  FROM parents as p, dogs as d
  WHERE p.parent = d.name
  ORDER BY - d.height;


-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT d.name, s.size
  FROM dogs as d, sizes as s
  WHERE d.height > s.min AND d.height <= s.max;


-- Filling out this helper table is optional
CREATE TABLE siblings AS
  SELECT a.child as first, b.child as second
  FROM parents as a, parents as b
  WHERE a.parent = b.parent AND a.child < b.child;

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  SELECT "The two siblings, " || a.first || " plus " || a.second || " have the same size: " || b.size
  FROM siblings as a, size_of_dogs as b, size_of_dogs as c
  WHERE b.name = a.first AND c.name = a.second AND b.size = c.size;

