# Laravel Docker Template

This repository provides a Docker setup for a Laravel application using PHP-FPM, Nginx, and MySQL. This setup uses PHP 8.1, which is required by the Laravel application. The HTTP server runs on port 8083 and MySQL data is stored locally.

## Prerequisites

- Docker
- Docker Compose

## Getting Started

### Clone the Repository

```bash
git clone https://github.com/your-repo/laravel-docker-template.git
cd laravel-docker-template

```python
your-laravel-project/
├── Dockerfile
├── Dockerfile.nginx
├── docker-compose.yml
├── nginx.conf
├── php.ini
├── mysql-data/
├── src/
│   ├── app/
│   ├── bootstrap/
│   ├── config/
│   ├── database/
│   ├── public/
│   ├── resources/
│   ├── routes/
│   ├── storage/
│   └── tests/
└── vendor/
```

### Configuration Files

- **Dockerfile**: Configuration for PHP-FPM with PHP 8.1.
- **Dockerfile.nginx**: Configuration for Nginx.
- **nginx.conf**: Custom Nginx configuration.
- **php.ini**: Custom PHP settings.
- **docker-compose.yml**: Docker Compose configuration.

### Custom PHP Settings

In `php.ini`:

```ini
upload_max_filesize = 50M
max_file_uploads = 50
post_max_size = 100M
```

### Build and Run the Containers

Navigate to your project directory in your terminal and run the following command:

```bash
docker-compose up --build
```

This command will build the Docker images and start the containers as per the `docker-compose.yml` configuration.

### Access Your Application

Once the containers are up and running, you can access your Laravel application in your browser at `http://localhost:8083`.

### Verify PHP Configuration (Optional)

To verify the PHP configuration settings, create a `info.php` file in the `public` directory of your Laravel application:

```bash
echo "<?php phpinfo(); ?>" > src/public/info.php
```

Open your browser and go to `http://localhost:8083/info.php`. Check the values of `upload_max_filesize`, `max_file_uploads`, and `post_max_size` to ensure they are set correctly. For security reasons, remove the `info.php` file after verification:

```bash
rm src/public/info.php
```

### Check Logs

If there are any issues, check the logs for both Nginx and PHP-FPM containers to get more details on what might be going wrong:

```bash
docker-compose logs web
docker-compose logs php-fpm
```

## Stopping the Containers

To stop the running containers, press `Ctrl + C` in the terminal where the containers are running or use the following command in another terminal:

```bash
docker-compose down
```

## Troubleshooting

- Ensure that Docker and Docker Compose are installed and running on your machine.
- Check the logs for errors using `docker-compose logs web` and `docker-compose logs php-fpm`.
- Ensure the directory structure is correct and matches the example provided.

## License

This project is licensed under the MIT License. See the LICENSE file for details.

## Contributing

Feel free to submit issues and pull requests to contribute to the project.

## Authors

- [Watthanasak Jeamwatthanachai](https://github.com/atlonxp)

```
