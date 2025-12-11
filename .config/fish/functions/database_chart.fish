function database_chart
    set -l container_name "chartdb-"(date +%s)

    docker run \
        --rm \
        --name $container_name \
        -p 8080:80 \
        -d \
        ghcr.io/chartdb/chartdb:latest

    echo "ChartDB started in background: $container_name"
    echo "Access at: http://localhost:8080"
end
