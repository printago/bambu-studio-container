# Use a base image, e.g., Ubuntu
FROM ubuntu:20.04

# Install dependencies
RUN apt-get update && apt-get install -y \
  wget \
  fuse \
  libfuse2 \
  && rm -rf /var/lib/apt/lists/*

# Add a user (optional but recommended)
RUN useradd -m appuser

# Switch to the appuser
USER appuser

# Create a directory for the AppImage
RUN mkdir /home/appuser/appimage

WORKDIR /home/appuser/appimage

RUN wget -O BambuStudio.AppImage https://github.com/bambulab/BambuStudio/releases/download/v01.09.02.57/Bambu_Studio_linux_ubuntu-v01.09.02.57.AppImage

# Make the AppImage executable
RUN chmod +x /home/appuser/appimage/BambuStudio.AppImage

# Run the AppImage (optional: specify an entry point or a command)
ENTRYPOINT ["/home/appuser/appimage/BambuStudio.AppImage"]