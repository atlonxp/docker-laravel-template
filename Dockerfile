# Use the official PHP image as a base
FROM php:8.1-fpm

# Set working directory
WORKDIR /var/www/html

# Install dependencies
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    locales \
    zip \
    jpegoptim optipng pngquant gifsicle \
    vim \
    unzip \
    git \
    curl \
    libonig-dev \
    libzip-dev

# Install PHP extensions one by one to identify issues
RUN docker-php-ext-install pdo_mysql && \
    echo "pdo_mysql installed successfully" && \
    docker-php-ext-install mbstring && \
    echo "mbstring installed successfully" && \
    docker-php-ext-install zip && \
    echo "zip installed successfully" && \
    docker-php-ext-install exif && \
    echo "exif installed successfully" && \
    docker-php-ext-install pcntl && \
    echo "pcntl installed successfully"

# Install GD extension
RUN docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/ && \
    docker-php-ext-install gd && \
    echo "gd installed successfully"

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Copy custom php.ini configuration
COPY php.ini /usr/local/etc/php/

# Copy existing application directory contents
COPY src/ /var/www/html

# Copy existing application directory permissions
COPY --chown=www-data:www-data src/ /var/www/html

# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["php-fpm"]

