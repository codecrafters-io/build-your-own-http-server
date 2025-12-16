ThisBuild / scalaVersion     := "3.7.4"
ThisBuild / version          := "0.1.0-SNAPSHOT"
ThisBuild / organization     := "com.codecrafters"
ThisBuild / organizationName := "CodeCrafters"

assembly / assemblyJarName := "http-server.jar"

lazy val root = (project in file("."))
  .settings(
    name := "codecrafter-http-server",
    // List your dependencies here
    libraryDependencies ++= Seq(
    )
  )
