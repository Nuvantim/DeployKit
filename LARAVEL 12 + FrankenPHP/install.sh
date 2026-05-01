#!/bin/bash
# Set environment file
mv .env.prod .env && \

# Install production dependencies only
composer install --no-dev --optimize-autoloader && \

# Generate application key first
php artisan key:generate && \

# Clear cache
php artisan optimize:clear && \

# Migrate database
php artisan migrate:fresh --seed --force && \

# Activate storage link 
php artisan storage:link
