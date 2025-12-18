// Re-export generated Rails routes and provide convenience aliases
export * from "./routes/index.js"

// Import specific route helpers to create aliases
import { tasksPath } from "./routes/index.js"

// Dashboard in the UI should point to tasks list
export const dashboardPath = (...args: Parameters<typeof tasksPath>) =>
  tasksPath(...args)
