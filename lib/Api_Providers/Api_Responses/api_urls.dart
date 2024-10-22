// Base URL
const String baseUrl = 'http://20.46.49.230/api';

// Projects URL
const String getProjectsByCnicUrl = '$baseUrl/getProjectsByCnic';

// Authentication URLs
const String loginUrl = '$baseUrl/auth/login';
const String registerUrl = '$baseUrl/register';
const String verifyOtpUrl = '$baseUrl/verify-otp';
const String forgotPasswordUrl = '$baseUrl/forgot-password';
const String resetPasswordUrl = '$baseUrl/reset-password';

// User URLs
const String userProfileUrl = '$baseUrl/user/profile';
const String updateUserProfileUrl = '$baseUrl/user/update-profile';
const String changePasswordUrl = '$baseUrl/user/change-password';

// Maintenance Task URLs
const String getTasksUrl = '$baseUrl/maintenance/tasks';
const String getTaskDetailsUrl = '$baseUrl/maintenance/tasks/details';
const String updateTaskStatusUrl = '$baseUrl/maintenance/tasks/update-status';

// Reports URLs
const String submitReportUrl = '$baseUrl/maintenance/report/submit';
const String getReportHistoryUrl = '$baseUrl/maintenance/report/history';

// Notifications URLs
const String getNotificationsUrl = '$baseUrl/notifications';
const String markNotificationAsReadUrl = '$baseUrl/notifications/read';

// Settings URLs
const String getAppSettingsUrl = '$baseUrl/settings';
const String updateAppSettingsUrl = '$baseUrl/settings/update';

// Support URLs
const String getSupportContactUrl = '$baseUrl/support/contact';
const String submitSupportTicketUrl = '$baseUrl/support/submit-ticket';
const String getSupportTicketHistoryUrl = '$baseUrl/support/ticket-history';
