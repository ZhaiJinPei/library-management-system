import {defineConfig} from 'vite'
import vue from '@vitejs/plugin-vue'
import AutoImport from 'unplugin-auto-import/vite'
import Components from 'unplugin-vue-components/vite'
import {ElementPlusResolver} from 'unplugin-vue-components/resolvers'

// 这里是创建文档之后vite贴出的官方文档地址
// https://vitejs.dev/config/
import path from 'path'

export default defineConfig({
    base: "./", //等同于  assetsPublicPath :'./'
    plugins: [
        vue(),
        AutoImport({
            resolvers: [ElementPlusResolver()],
        }),
        Components({
            resolvers: [ElementPlusResolver()],
        }),
    ],
    resolve: {
        alias: {
            "@": path.resolve(__dirname, "src"),
            "view": path.resolve(__dirname, "src/view"),
            "components": path.resolve(__dirname, "src/components"),
            "assets": path.resolve(__dirname, "src/assets"),
            "store": path.resolve(__dirname, "src/store"),
            "mixins": path.resolve(__dirname, "src/mixins"),
        },
    },
    css: {
        preprocessorOptions: {
            scss: {
                additionalData: '@import "./src/assets/styles/common.scss";'
            }
        }
    },
    // 开发服务器配置server
    server: {
        // host指定服务器应该监听哪个 IP 地址。 如果将此设置为 0.0.0.0 或者 true 将监听所有地址，包括局域网和公网地址。
        host: true,
        // 开发服务器端口配置。（注意：如果配置的端口已经被使用，Vite 会自动尝试下一个可用的端口，要看项目运行时最终生成的端口地址。）
        port: '80',
        // open项目运行完毕是否自动在默认浏览器打开
        open: true,
        // 是否使用https，需要证书
        https: false,
        // proxy代理配置
        proxy: {
            '/api': {
                target: 'http://localhost:7000',
                changeOrigin: true,
                rewrite: path => path.replace(/^\/api/, '')
            }
        }
    },
});
