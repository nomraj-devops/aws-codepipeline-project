import styles from "./page.module.css";

export default function Home() {
  return (
    <main className={styles.main}>
      <div className={styles.center}>
        <h1>Welcome to Rapyder!</h1>
        <h1>my application is running</h1>
      </div>
    </main>
  );
}
