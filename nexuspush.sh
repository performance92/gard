#!/bin/bash

# Nexus URL ve Repository Ayarları
NEXUS_URL="nexus.cekino.local:5000"
REPOSITORY_NAME="docker-hosted"

# Docker'daki mevcut imajları al
images=$(docker images --format "{{.Repository}}:{{.Tag}} {{.ID}}")

# İşlem sırasında durumu kontrol etmek için log dosyası
LOG_FILE="docker_push_log.txt"
echo "Log Dosyası: $LOG_FILE" > $LOG_FILE

# Push işlemi sırasında bekleme süresi (saniye)
SLEEP_INTERVAL=10

# Tüm imajları etiketle ve Nexus'a push et
while IFS= read -r image; do
    IMAGE_NAME=$(echo $image | awk '{print $1}')
    IMAGE_ID=$(echo $image | awk '{print $2}')

    # Eğer IMAGE_NAME veya IMAGE_ID boşsa devam et
    if [ -z "$IMAGE_NAME" ] || [ -z "$IMAGE_ID" ]; then
        echo "Geçersiz imaj bilgisi, atlanıyor..." | tee -a $LOG_FILE
        continue
    fi

    # Çalışan container var mı kontrol et (sadece bilgi amaçlı)
    RUNNING_CONTAINERS=$(docker ps --filter "ancestor=$IMAGE_NAME" --format "{{.ID}}")
    if [ ! -z "$RUNNING_CONTAINERS" ]; then
        echo "Bu imajla çalışan container(lar) bulundu: $IMAGE_NAME. İşleme devam ediliyor..." | tee -a $LOG_FILE
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
    echo "Etiketleniyor: $IMAGE_NAME -> $NEW_TAG" | tee -a $LOG_FILE
    
    # İmajı etiketle
    docker tag "$IMAGE_NAME" "$NEW_TAG"

    # Nexus'a push et
    echo "Push ediliyor: $NEW_TAG" | tee -a $LOG_FILE
    docker push "$NEW_TAG"
    
    # Bekleme süresi
    echo "Bekliyor... ($SLEEP_INTERVAL saniye)" | tee -a $LOG_FILE
    sleep $SLEEP_INTERVAL
done <<< "$images"

echo "Tüm işlemler tamamlandı. Log: $LOG_FILE"

