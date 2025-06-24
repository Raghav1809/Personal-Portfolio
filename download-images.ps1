# Create images directory if it doesn't exist
$imagesDir = "i:\Projects\Web based Projects\Personal Resume\images"
if (-not (Test-Path $imagesDir)) {
    New-Item -ItemType Directory -Path $imagesDir
}

# Define image URLs (using professional stock photos)
$imageUrls = @{
    "avatar.jpg" = "https://randomuser.me/api/portraits/men/32.jpg"
    "testimonial-1.jpg" = "https://randomuser.me/api/portraits/men/41.jpg"
    "testimonial-2.jpg" = "https://randomuser.me/api/portraits/women/44.jpg"
    "testimonial-3.jpg" = "https://randomuser.me/api/portraits/men/55.jpg"
    "eduford-project.jpg" = "https://images.unsplash.com/photo-1523050854058-8df90110c9f1?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80"
    "prozen-project.jpg" = "https://images.unsplash.com/photo-1460925895917-afdab827c52f?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80"
}

# Download each image
foreach ($image in $imageUrls.GetEnumerator()) {
    $outputPath = Join-Path -Path $imagesDir -ChildPath $image.Key
    Write-Host "Downloading $($image.Key)..."
    Invoke-WebRequest -Uri $image.Value -OutFile $outputPath
}

Write-Host "All images downloaded successfully!"