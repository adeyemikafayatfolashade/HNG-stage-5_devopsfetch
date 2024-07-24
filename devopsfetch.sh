#!/bin/bash

# Function to display help message
display_help() {
    echo "Usage: $0 [option]"
    echo
    echo "Options:"
    echo "  -p, --port [port_number]        Display active ports and services, or detailed info about a specific port"
    echo "  -d, --docker [container_name]   List Docker images and containers, or detailed info about a specific container"
    echo "  -n, --nginx [domain]            Display Nginx domains and ports, or detailed info about a specific domain"
    echo "  -u, --users [username]          List users and last login times, or detailed info about a specific user"
    echo "  -t, --time <start> <end>        Display activities within a specified time range"
    echo "  -h, --help                      Display this help message"
}

# Function to display active ports and services
display_ports() {
    if [ -z "$1" ]; then
        ss -tuln
    else
        ss -tuln | grep ":$1 "
    fi

}

# Function to display Docker images and containers
display_docker() {
    if [ -z "$1" ]; then
        docker images
        docker ps -a
    else
        docker inspect "$1"
    fi
}

# Function to display Nginx domains and ports
display_nginx() {
    if [ -z "$1" ]; then
        nginx -T 2>/dev/null | grep -E 'server_name|listen'
    else
        nginx -T 2>/dev/null | awk "/server_name.*$1/,/}/"
    fi
}

# Function to list users and last login times
display_users() {
    if [ -z "$1" ]; then
        lastlog
    else
        last "$1"
    fi
}

# Function to display activities within a specified time range
display_activities() {
    journalctl --since="$1" --until="$2"
}

# Parse command line arguments
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -p|--port) PORT="$2"; shift ;;
        -d|--docker) DOCKER="$2"; shift ;;
        -n|--nginx) NGINX="$2"; shift ;;
        -u|--users) USERS="$2"; shift ;;
        -t|--time) TIME_START="$2"; TIME_END="$3"; shift; shift ;;
        -h|--help) display_help; exit 0 ;;
        *) echo "Unknown parameter passed: $1"; display_help; exit 1 ;;
    esac
    shift
done

# Execute functions based on arguments
if [ ! -z "$PORT" ]; then
    display_ports "$PORT"
elif [ ! -z "$DOCKER" ]; then
    display_docker "$DOCKER"
elif [ ! -z "$NGINX" ]; then
    display_nginx "$NGINX"
elif [ ! -z "$USERS" ]; then
    display_users "$USERS"
elif [ ! -z "$TIME_START" ] && [ ! -z "$TIME_END" ]; then
    display_activities "$TIME_START" "$TIME_END"
else
    display_help
fi
