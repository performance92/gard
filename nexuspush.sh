#!/bin/bash

# Nexus URL ve Repository Ayarları
NEXUS_URL="nexus.cekino.local:5000"
REPOSITORY_NAME="docker-hosted"

# Docker'daki mevcut imajları al
images=$(docker images --format "{{.Repository}}:{{.Tag}} {{.ID}}")

# Tüm imajları etiketle ve Nexus'a push et
while IFS= read -r image; do
    IMAGE_NAME=$(echo $image | awk '{print $1}')
    IMAGE_ID=$(echo $image | awk '{print $2}')

    # Eğer IMAGE_NAME veya IMAGE_ID boşsa devam et
    if [ -z "$IMAGE_NAME" ] || [ -z "$IMAGE_ID" ]; then
        echo "Geçersiz imaj bilgisi, atlanıyor..."
        continue
    fi

    # Tag'ı ayrıştır
    IMAGE_TAG=$(echo $IMAGE_NAME | awk -F ':' '{print $2}')
    IMAGE_REPO=$(echo $IMAGE_NAME | awk -F ':' '{print $1}')

    # Eğer IMAGE_TAG boşsa, varsayılan olarak 'latest' kullan
    if [ -z "$IMAGE_TAG" ]; then
        IMAGE_TAG="latest"
    fi

    # Nexus için yeni etiket oluştur
    NEW_TAG="${NEXUS_URL}/${REPOSITORY_NAME}/${IMAGE_REPO}:${IMAGE_TAG}"
    echo "Etiketleniyor: $IMAGE_NAME -> $NEW_TAG"
    
    # İmajı etiketle
    docker tag "$IMAGE_NAME" "$NEW_TAG"

    # Nexus'a push et
    echo "Push ediliyor: $NEW_TAG"
    docker push "$NEW_TAG"
done <<< "$images"

