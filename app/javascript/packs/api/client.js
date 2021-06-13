import axios from 'axios';

const API_URL = 'http://localhost:3000'

export const apiClient = axios.create({
  // baseURL:          window.location.origin,
  baseURL: API_URL,
  headers:          {
    Accept:         'application/json',
    'Content-Type': 'application/json',
    'X-CSRF-Token': document.getElementsByName("csrf-token")[0].getAttribute("content")
  },
  timeout:          30000
});

export const api = {
  getFeedbacks() {
    return apiClient.get(`/api/v1/feedbacks`);
  },
  postFeedbacks(title, description, rating) {
    return apiClient.post(`/api/v1/feedbacks`, { feedback: { title: title, description: description, rating: rating}});
  }
}