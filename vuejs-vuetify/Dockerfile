#
# Stage: Base Build
#
FROM node:13.12.0-stretch-slim AS base-build
RUN mkdir /app
WORKDIR /app
COPY package.json yarn.lock /app/
RUN yarn install

#
# Stage: Development
#
FROM base-build AS dev
COPY . /app
WORKDIR /app
ENV HOST=0.0.0.0
CMD ["yarn", "run", "serve"]

#
# Stage: Prd Build
#
FROM node:13.12.0-stretch-slim AS prd-build
COPY --from=dev /app /app
WORKDIR /app
RUN yarn build

#
# Stage: Production
#
FROM nginx:1.17.9 AS prd
COPY --from=prd-build /app/dist/ /usr/share/nginx/html/
