import { BrowserRouter, Routes, Route, Navigate } from 'react-router-dom'
import { AuthProvider, useAuth } from './context/AuthContext'
import ProtectedRoute from './routes/ProtectedRoute'
import GuestRoute from './routes/GuestRoute'

import Login from './pages/Login'
import DashboardAdmin from './pages/DashboardAdmin'
import DashboardChef from './pages/DashboardChef'
import DashboardCashier from './pages/DashboardCashier'
import { NotFound, Unauthorized } from './pages/NotFound'

function RootRedirect() {
  const { user } = useAuth()
  if (!user) return <Navigate to="/login" replace />

  const map = { admin: '/admin/dashboard', chef: '/chef/dashboard', cashier: '/cashier/dashboard' }
  return <Navigate to={map[user.role] || '/login'} replace />
}

export default function App() {
  return (
    <AuthProvider>
      <BrowserRouter>
        <Routes>
          <Route path="/" element={<RootRedirect />} />
          <Route
            path="/login"
            element={
              <GuestRoute>
                <Login />
              </GuestRoute>
            }
          />
          <Route path="/unauthorized" element={<Unauthorized />} />

          <Route
            path="/admin/dashboard"
            element={
              <ProtectedRoute allowedRoles={['admin']}>
                <DashboardAdmin />
              </ProtectedRoute>
            }
          />

          <Route
            path="/chef/dashboard"
            element={
              <ProtectedRoute allowedRoles={['chef']}>
                <DashboardChef />
              </ProtectedRoute>
            }
          />

          <Route
            path="/cashier/dashboard"
            element={
              <ProtectedRoute allowedRoles={['cashier']}>
                <DashboardCashier />
              </ProtectedRoute>
            }
          />

          <Route path="*" element={<NotFound />} />
        </Routes>
      </BrowserRouter>
    </AuthProvider>
  )
}
