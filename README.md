# Maktaba

Maktaba is a Ruby on Rails 8 application designed to manage a digital library system efficiently.

## 🚀 Features
- Built with **Ruby on Rails 8**
- Uses **SQLite** as the database
- Hotwire (**Turbo & Stimulus**) for an interactive UI
- Background job processing with **Solid Queue**
- Deployed using **Docker & Kamal**

## 📦 Getting Started with Docker

### Prerequisites
Ensure you have the following installed:
- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

### 🔧 Setup & Run
1. **Clone the repository**
   ```sh
   git clone git@github.com:hanselomondi/Maktaba.git
   cd maktaba
   ```

2. **Create an `.env` file**
   ```sh
   echo "RAILS_MASTER_KEY=<your-master-key>" > .env
   ```

3. **Build & Run the App**
   ```sh
   docker-compose up --build -d
   ```
   - The app runs on **http://localhost:80**
   - The SQLite database is persisted in a Docker volume

4. **Run Migrations (if needed)**
   ```sh
   docker exec -it maktaba bin/rails db:migrate
   ```

### 🛠️ Managing the App
- **View logs:** `docker-compose logs -f`
- **Stop the app:** `docker-compose down`
- **Restart the app:** `docker-compose up -d`

### 🏗️ Running Background Jobs
The app uses **Solid Queue** for background jobs.
To start the worker manually:
```sh
 docker-compose exec app bin/rails solid_queue:work
```

## 🧑‍💻 Development (Optional)
If you prefer local development **without Docker**, follow these steps:
1. Install **Ruby 3.3.7** and **Bundler**
2. Install dependencies: `bundle install`
3. Setup database: `bin/rails db:setup`
4. Start the server: `bin/rails server`

## 📜 License
This project is licensed under the MIT License.

