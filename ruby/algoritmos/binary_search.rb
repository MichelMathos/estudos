def binarysearch(arr, n, k)
    left = 0
    right = n-1

    while left <= rightmid = left + (right - left) / 2

        if arr[mid] == K
            return mid
        elsif arr[mid] < Kleft = mid + 1
        else
            right = mid - 1
        end
    end

    return -1
end

#Exemplo de uso:

arr = [2, 4, 5, 8, 10, 12, 14, 16]
n = arr.length
k = 10

posicao = binarysearch(arr, n, k)

if posicao !=-1

    