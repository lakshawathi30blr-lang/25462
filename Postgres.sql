-- employees table
CREATE TABLE IF NOT EXISTS employees (
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    manager_id INTEGER REFERENCES employees(employee_id),
    email VARCHAR(100) UNIQUE NOT NULL
);

-- goals table
CREATE TABLE IF NOT EXISTS goals (
    goal_id SERIAL PRIMARY KEY,
    employee_id INTEGER REFERENCES employees(employee_id) ON DELETE CASCADE,
    manager_id INTEGER REFERENCES employees(employee_id) ON DELETE SET NULL,
    description TEXT NOT NULL,
    due_date DATE NOT NULL,
    status VARCHAR(50) DEFAULT 'Draft',
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- tasks table
CREATE TABLE IF NOT EXISTS tasks (
    task_id SERIAL PRIMARY KEY,
    goal_id INTEGER REFERENCES goals(goal_id) ON DELETE CASCADE,
    employee_id INTEGER REFERENCES employees(employee_id) ON DELETE SET NULL,
    description TEXT NOT NULL,
    status VARCHAR(50) DEFAULT 'To Do'
);

-- feedback table
CREATE TABLE IF NOT EXISTS feedback (
    feedback_id SERIAL PRIMARY KEY,
    goal_id INTEGER REFERENCES goals(goal_id) ON DELETE CASCADE,
    manager_id INTEGER REFERENCES employees(employee_id) ON DELETE SET NULL,
    feedback_text TEXT NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);