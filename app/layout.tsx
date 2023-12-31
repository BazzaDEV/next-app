import type { Metadata } from 'next'
// import localFont from 'next/font/local'
import './globals.css'

// const inter = localFont({
//   src: '../assets/Inter_variable.ttf',
//   display: 'swap',
// })

export const metadata: Metadata = {
  title: 'Create Next App',
  description: 'Generated by create next app',
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en">
      <body 
      // className={inter.className}
    >
      {children}
      </body>
    </html>
  )
}
