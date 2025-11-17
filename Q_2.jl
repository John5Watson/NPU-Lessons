function primes(id)
    # 检查输入是否为有效的三位数（100-999）
    if !(id isa Integer) || id < 100 || id > 999
        println("请输入有效的学号后三位（100-999）")
        return
    end
    
    println("小于$(id)的所有质数为：")
    
    count = 0
    for num in 2:id-1
        is_prime = true
        # 检查num是否为质数
        for i in 2:isqrt(num)
            if num % i == 0
                is_prime = false
                break
            end
        end
        if is_prime
            print(num, "\t")
            count += 1
            if count % 5 == 0
                println()
            end
        end
    end
    println()
end

# 主程序
id = 709
primes(id)
