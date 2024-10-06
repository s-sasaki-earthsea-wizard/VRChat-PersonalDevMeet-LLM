# Use Ruby 3.2 slim-bullseye as the base image
FROM ruby:3.2-slim-bullseye

# Set ARGs for user creation
ARG USER_ID
ARG GROUP_ID

# Create a non-root user
RUN groupadd -g ${GROUP_ID} fusuma && \
    useradd -u ${USER_ID} -g fusuma -m fusuma

# Set the working directory in the container
WORKDIR /app

# Debug: コンフィグファイルを明示的にコピー
COPY --chown=fusuma:fusuma ./app/config/fusuma/config.yml /app/config/fusuma/config.yml

# Install dependencies for Fusuma
RUN apt-get update && apt-get install -y \
    libinput-tools \
    xdotool \
    && rm -rf /var/lib/apt/lists/*

# Add libinput to the PATH
ENV PATH="/usr/libexec/libinput:$PATH"

# Install Fusuma
RUN gem install fusuma

# Create input group and add fusuma user to it
RUN groupadd -f input && usermod -a -G input fusuma

# Copy the application code to the working directory
COPY --chown=fusuma:fusuma . .

# Create necessary directories for Fusuma
RUN mkdir -p /home/fusuma/.config/fusuma && \
    chown -R fusuma:fusuma /home/fusuma/.config

# Switch to non-root user
USER fusuma

# Expose the port specified in the .env file
EXPOSE ${FUSUMA_PORT}

# Command to run Fusuma
CMD ["bash"]