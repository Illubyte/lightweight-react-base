import React from 'react'

export const App: React.FC = ( props ) => {
  return (
    <div className="grid grid-cols-5 place-content-center h-screen">
      <div className='notice bg-white rounded-3xl shadow-2xl p-8 mx-auto my-8 col-span-3 max-w-4xl col-start-2'>
        <h1>Success!</h1>
        <p>
          App is being served from <code>./dist</code> folder. Customize the source files in the <code>./src</code> folder, then use <code>yarn build</code> or <code>npm run build</code> to generate a new production build. Alternatively, you may use <code>yarn start</code> or <code>npm start</code> in order to serve app on Parcel&apos;s local development server.
        </p>
        <aside>
          <span className="font-bold">Notice:</span> In order to securely deploy this app to production, you should first set up a public-facing web server / reverse proxy, such as NGINX. With that done, you can direct to the <code>index.html</code> file located in the <code>./dist</code> folder.
          <br />
          <br />
          If running via Parcel development server, using <code>yarn start</code> or <code>npm start</code>, by default the app will be available from <code>localhost:4440</code>. If running in Docker container, the port may be mapped differently.
        </aside>
      </div>
    </div>
  )
}