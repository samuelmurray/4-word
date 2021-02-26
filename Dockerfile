FROM swipl
COPY . /app
WORKDIR /app
CMD ["swipl", "main.pl"]