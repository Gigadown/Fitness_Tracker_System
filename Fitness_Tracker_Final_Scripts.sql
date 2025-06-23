-- Phase 1: Schema Definitions
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    age INT CHECK (age >= 13),
    gender VARCHAR(10),
    height_cm DECIMAL(5,2),
    weight_kg DECIMAL(5,2)
);

CREATE TABLE Exercises (
    exercise_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    category VARCHAR(30),
    calories_burned_per_min DECIMAL(5,2)
);

CREATE TABLE Workouts (
    workout_id INT PRIMARY KEY,
    user_id INT,
    workout_date DATE,
    duration_minutes INT,
    notes TEXT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Workout_Exercise (
    workout_id INT,
    exercise_id INT,
    duration_minutes INT,
    PRIMARY KEY (workout_id, exercise_id),
    FOREIGN KEY (workout_id) REFERENCES Workouts(workout_id),
    FOREIGN KEY (exercise_id) REFERENCES Exercises(exercise_id)
);

CREATE TABLE HealthMetrics (
    metric_id INT PRIMARY KEY,
    user_id INT,
    record_date DATE,
    weight DECIMAL(5,2),
    heart_rate INT,
    sleep_hours DECIMAL(3,1),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Goals (
    goal_id INT PRIMARY KEY,
    user_id INT,
    goal_type VARCHAR(50),
    target_weight DECIMAL(5,2),
    start_date DATE,
    end_date DATE,
    status VARCHAR(20),
    CHECK (start_date <= end_date),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE DietPlans (
    diet_id INT PRIMARY KEY,
    user_id INT,
    plan_name VARCHAR(50),
    description TEXT,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Phase 2: Sample Data Inserts (only partial for brevity)
INSERT INTO Users VALUES 
(1, 'Alice', 'alice@example.com', 25, 'Female', 165.0, 60.0),
(2, 'Bob', 'bob@example.com', 30, 'Male', 175.0, 75.0),
(3, 'Charlie', 'charlie@example.com', 22, 'Male', 180.0, 70.0),
(4, 'Diana', 'diana@example.com', 28, 'Female', 160.0, 58.0),
(5, 'Ethan', 'ethan@example.com', 26, 'Male', 178.0, 72.5),
(6, 'Fiona', 'fiona@example.com', 24, 'Female', 158.0, 54.0),
(7, 'George', 'george@example.com', 35, 'Male', 182.0, 85.0),
(8, 'Hannah', 'hannah@example.com', 31, 'Female', 162.0, 62.0),
(9, 'Ian', 'ian@example.com', 29, 'Male', 170.0, 68.0),
(10, 'Jenny', 'jenny@example.com', 27, 'Female', 167.0, 59.5);

INSERT INTO Exercises VALUES 
(101, 'Running', 'Cardio', 10.5),
(102, 'Push-Ups', 'Strength', 8.0),
(103, 'Cycling', 'Cardio', 9.0),
(104, 'Squats', 'Strength', 7.5),
(105, 'Swimming', 'Cardio', 11.0),
(106, 'Plank', 'Core', 6.5),
(107, 'Jump Rope', 'Cardio', 10.0),
(108, 'Bench Press', 'Strength', 9.5),
(109, 'Yoga', 'Flexibility', 5.0),
(110, 'Deadlift', 'Strength', 10.2);

INSERT INTO Workouts VALUES 
(201, 1, '2025-06-19', 45, 'Morning cardio session'),
(202, 2, '2025-06-19', 30, 'Strength training'),
(203, 3, '2025-06-20', 40, 'Mixed workout'),
(204, 4, '2025-06-20', 50, 'Cardio blast'),
(205, 5, '2025-06-21', 35, 'Leg day'),
(206, 6, '2025-06-21', 25, 'Quick HIIT'),
(207, 7, '2025-06-22', 60, 'Power session'),
(208, 8, '2025-06-22', 30, 'Stretching and core'),
(209, 9, '2025-06-23', 45, 'Upper body focus'),
(210, 10, '2025-06-23', 30, 'Morning yoga');

INSERT INTO Workout_Exercise VALUES 
(201, 101, 20),
(201, 103, 25),
(202, 102, 30),
(203, 104, 20),
(203, 106, 20),
(204, 105, 30),
(205, 104, 25),
(206, 107, 25),
(207, 108, 30),
(208, 109, 30),
(209, 102, 20),
(209, 110, 25),
(210, 109, 30);

INSERT INTO HealthMetrics VALUES 
(301, 1, '2025-06-18', 60.2, 72, 7.5),
(302, 2, '2025-06-18', 74.8, 68, 6.0),
(303, 3, '2025-06-19', 69.5, 70, 7.0),
(304, 4, '2025-06-19', 57.0, 75, 6.5),
(305, 5, '2025-06-20', 72.5, 67, 7.2),
(306, 6, '2025-06-20', 54.1, 69, 6.8),
(307, 7, '2025-06-21', 85.0, 71, 7.4),
(308, 8, '2025-06-21', 62.0, 73, 7.1),
(309, 9, '2025-06-22', 68.0, 70, 7.6),
(310, 10, '2025-06-22', 59.5, 66, 6.9);

INSERT INTO Goals VALUES 
(401, 1, 'Weight Loss', 55.0, '2025-06-01', '2025-08-01', 'Ongoing'),
(402, 2, 'Muscle Gain', 80.0, '2025-06-10', '2025-09-10', 'Ongoing'),
(403, 3, 'Endurance', 45.0, '2025-06-15', '2025-07-30', 'Ongoing'),
(404, 4, 'Flexibility', 50.0, '2025-06-12', '2025-08-01', 'Ongoing'),
(405, 5, 'Stamina', 65.0, '2025-06-18', '2025-07-30', 'Ongoing'),
(406, 6, 'Weight Maintenance', 54.0, '2025-06-20', '2025-08-20', 'Ongoing'),
(407, 7, 'Strength', 90.0, '2025-06-10', '2025-09-10', 'Ongoing'),
(408, 8, 'Yoga Practice', 60.0, '2025-06-11', '2025-08-11', 'Ongoing'),
(409, 9, 'Fat Loss', 62.0, '2025-06-14', '2025-08-14', 'Ongoing'),
(410, 10, 'Relaxation', 58.0, '2025-06-10', '2025-07-10', 'Ongoing');

INSERT INTO DietPlans VALUES 
(501, 1, 'Keto Lite', 'Low carb, moderate protein', '2025-06-10', '2025-07-10'),
(502, 2, 'High Protein', 'Muscle building focused meals', '2025-06-15', '2025-07-15'),
(503, 3, 'Endurance Fuel', 'Carb-rich diet for running', '2025-06-12', '2025-07-12'),
(504, 4, 'Detox Plan', 'Veggies, fruits and detox drinks', '2025-06-13', '2025-07-13'),
(505, 5, 'Balanced Diet', 'All nutrients in moderation', '2025-06-14', '2025-07-14'),
(506, 6, 'Low Fat Plan', 'Minimized fat, high fiber', '2025-06-15', '2025-07-15'),
(507, 7, 'Muscle Fuel', 'High protein + complex carbs', '2025-06-16', '2025-07-16'),
(508, 8, 'Ayurvedic Cleanse', 'Herbs and Indian spices based', '2025-06-17', '2025-07-17'),
(509, 9, 'Fat Burn Meal', 'Low calorie, high activity meals', '2025-06-18', '2025-07-18'),
(510, 10, 'Meditation Boost', 'Foods promoting calm and sleep', '2025-06-19', '2025-07-19');

-- Phase 3: Indexes
CREATE INDEX idx_user_id ON Workouts(user_id);
CREATE INDEX idx_workout_date ON Workouts(workout_date);

-- Phase 4: Automation
-- Stored Procedure
DELIMITER //
CREATE PROCEDURE AddWorkout (
    IN p_workout_id INT,
    IN p_user_id INT,
    IN p_workout_date DATE,
    IN p_duration INT,
    IN p_notes VARCHAR(255)
)
BEGIN
    INSERT INTO Workouts(workout_id, user_id, workout_date, duration_minutes, notes)
    VALUES (p_workout_id, p_user_id, p_workout_date, p_duration, p_notes);
END //
DELIMITER ;

-- Trigger
DELIMITER //
CREATE TRIGGER check_goal_dates
BEFORE INSERT ON Goals
FOR EACH ROW
BEGIN
    IF NEW.end_date < NEW.start_date THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'End date must be after start date';
    END IF;
END //
DELIMITER ;

-- Transaction Example
START TRANSACTION;
INSERT INTO Workouts (workout_id, user_id, workout_date, duration_minutes, notes)
VALUES (211, 1, '2025-06-22', 50, 'HIIT training');
SAVEPOINT before_health;
INSERT INTO HealthMetrics (metric_id, user_id, metric_date, weight_kg, heart_rate, sleep_hours)
VALUES (311, 1, NULL, 59.5, 72, 6.5);  -- ERROR: metric_date is NULL
ROLLBACK TO before_health;
COMMIT;

-- JSON Data Example
CREATE TABLE UserPreferences (
    preference_id INT PRIMARY KEY,
    user_id INT,
    preferences JSON,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

INSERT INTO UserPreferences (preference_id, user_id, preferences)
VALUES (
    1, 
    1, 
    JSON_OBJECT('theme', 'dark', 'notifications', true, 'units', 'metric')
);

