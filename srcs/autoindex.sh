if [ "$1" = "on" ]; then
	sed -i 11's/\boff/on/' /etc/nginx/sites-available/config && \
	nginx -s reload
elif [ "$1" = "off" ]; then
	sed -i 11's/\bon/off/' /etc/nginx/sites-available/config && \
	nginx -s reload
fi